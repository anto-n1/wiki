# Fstab


Ajouter un disque ou une partition à un point de montage
sur une machine Linux :


Récupérer l'UUID du disque ou de la partition :

```bash
blkid /dev/sda1
```

Editer /etc/fstab et ajouter la ligne suivante :

```bash
UUID=<uuid>					  /point/de/montage   <système ficier> donner les droits à tout le monde
UUID=9420-B08F				  /media/swap-disk	  vfat	rw,user,exec,umask=000 0 2
```

Vérification du fichier fstab (système peut ne pas redémarrer correctement
en cas d'erreur) :

```bash
sudo findmnt --verify --verbose
```