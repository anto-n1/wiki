# Fail2ban

## Commandes principales de fail2ban

* Afficher les jails :  
```
fail2ban-client status
```

* Arrêter une jail :
```
fail2ban-client stop sshd
```

* Vérifier fonctionnement d'une jail :
```
fail2ban-client status sshd
```

## Gestion du banissement

* Bannir manuellement une IP :
```
fail2ban-client set <nom_jail> banip <ip>
```

* Débannir manuellement une IP :
```
fail2bon-client set <nom_jail> unbanip <ip>
```