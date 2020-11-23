# Top 10 des commandes utilisées

Pour afficher le top 10 des commandes utilisées sous Linux ou macOS, lancer la commande suivante :  

Si bash :
```
cat ~/.bash_history | sort |uniq -c|sort -nr|head -n 10
```

Si zsh :
```
cat ~/.zsh_history | sort |uniq -c|sort -nr|head -n 10
```