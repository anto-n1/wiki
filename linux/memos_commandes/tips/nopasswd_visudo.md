# Sudo without password

Don't ask password for sudo commands on Linux :  

Run the following command to edit the sudoers file :
```
sudo visudo
```

Add the following line in the file to disable the ask password for precise commands :  
```
username ALL=(ALL) NOPASSWD: /usr/bin/command, /usr/bin/command2
```

Add the following line to disable ask password for all commands :  
```
username  ALL=(ALL)  NOPASSWD: ALL
```