# Installation d'Arch Linux sur Razer Blade 15" 2019

## Prérequis

1. Connexion internet filaire
2. Clé USB Arch Linux bootable servant à installer le système

L'installation se fera en EFI, non en BIOS.

## Problèmes

**Multiples moniteurs non fonctionnels**

Solutions :
1. Installer Arch sans aucun driver graphique et CPU. Les installer un par un et vérifier le fonctionnement ou non des écrans externes
2. Utiliser xfwm avant d'utiliser lightdm. Si non fonctionnel essayer autres gestionnaires comme SDDM ou GDM.

## TODO

* Gérer les multiples moniteurs HDMI et VGA
* Gérer LVM et le chiffrement du disque dur
* xfdashboard et xfce4-hotcorner-plugin pour les coins actifs

## Installation de la base du système

Après démarrage sur clé USB, on arrive sur un bash connecté en tant que root.

Passer le clavier en azerty :

```bash
loadkeys fr
```

#### Création des partitions

Lister les disques disponibles pour installer le système et en choisir un :

```bash
fdisk -l
```

Utilisation de cfdisk, utilitaire "graphique" en ligne de commande, ici avec le disque /dev/sda sélectionné :

```bash
# Possibilité de supprimer toutes les partitions d'un coup avec sgdisk
sgdisk --zap-all /dev/sda
# Sinon les supprimer une par une depuis cfdisk
cfdisk /dev/sda
```

Exemple de partitionnement :

| Référence |  Point de montage |  Taille               |   Système de fichiers |
|-----------|-------------------|-----------------------|-----------------------|
| /dev/sda1 | /boot/efi         | 512 Mo                |  fat32                |
| /dev/sda2 |                   | Un peu comme on veut  |  swap                 |
| /dev/sda3 | /                 | 20 Go minimum         |  ext4                 |
| /dev/sda4 | /home             | Le reste du disque    |  ext4                 |

Créer la partition de swap :

```bash
mkswap /dev/sda2
swapon /dev/sda2
```

Créer les partitions :

```bash
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4
```

Créer les points de montage et y associer les partitions qui correspondent. On ne monte pas la partition /boot, cette opération sera réalisée plus tard.

```bash
mkdir /mnt/{boot,home}
mkdir /mnt/boot/efi
mount /dev/sda3 /mnt
mount /dev/sda4 /mnt/home
```

#### Gestionnaire de paquets et installation noyeau

On commence par choisir un ou des miroir pacman à utiliser en éditant le fichier /etc/pacman.d/mirrotlist. Commenter et décommenter en fonction des besoins et localisation.

On installe ensuite le noyeau Linux. Ici on installe linux-zen. Possibilité d'installer d'autres noyeaux avec la correspondance suivante (plus d'infos [à cette adresse](https://wiki.archlinux.org/index.php/Kernel)) :

| Noyeau     |  Nom paquet    | Informations                                            |
|------------|----------------|---------------------------------------------------------| 
| Stable     | linux          | Noyeau stable -> vanilla                                |
| Hardened   | linux-hardened | Axé sécurité                                            |
| Longterm   | linux-lts      | Noyeau LTS                                              |
| Zen Kernel | linux-zen      | Optimisé desktop avec firmwares des derniers composants |

```bash
pacstrap /mnt base linux-firmware linux-zen
```

#### Génération fstab

Génération d'un fichier fstab (fichier qui indique quelles partitions monter au démarrage du système) :

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

#### Gestion des locales

On se chroot dans le nouveau système

```bash
arch-chroot /mnt
```

On installe un éditeur de texte en ligne de commande pour pouvoir éditer les fichiers qui vont suivre avec par exemple ```pacman -S vim```.

Gestion du fuseau horaire et génération du fichier /etc/adjtime :

```bash
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc
```

Gestion de la localisation en éditant le fichier /etc/locale.gen et décommentant en_US.UTF-8 UTF-8. Ensuite on génère les locales :

```bash
locale-gen
```

Editer le fichier /etc/locale.conf et ajouter la langue :

```bash
LANG=en_US.UTF-8
```

Passer le clavier en français par défaut en éditant le fichier /etc/vconsole.conf et en ajoutant :

```bash
KEYMAP=fr-latin9
```

#### Hostname et fichier hosts

Donner un nom à la machine en écrivant le nom souhaité de la machine dans /etc/hostname. Exemple, ajouter "archlinux" dans le fichier sur une seule ligne.

On édite ensuite le fichier /etc/hosts et on ajoute les infos suivantes (myhostname à remplacer par son hostname défini dans le fichier précédent) :

```bash
127.0.0.1   localhost
::1         localhost
127.0.1.1   myhostname.localdomain	myhostname
```

#### Ajout utilisateur administrateur

Définition d'un mot de passe à root avec la commande ```passwd```.

Installation de zsh avant pour que l'utilisateur puisse l'utiliser en tant que shell par défaut, mais aussi de sudo et which :

```bash
pacman -S zsh sudo which
```

Autorisation des utilisateurs administrateurs en décommentant la ligne du groupe wheel après exécution de ```visudo``` :

```bash
%wheel      ALL = (ALL) ALL
```

Ajout d'un utilisateur administrateur, avec répertoire home et shell zsh, puis ajout au groupe wheel et création d'un mot de passe :

```bash
useradd -m --home /home/monutilisateur --shell $(which zsh) --comment "Mon utilisateur" monutilisateur
gpasswd -a monutilisateur wheel
passwd monutilisateur
```

#### Bootloader

Il faut choisir entre BIOS et UEFI. Ce choix a normalement déjà été fait lors du partitionnement et de la partition /boot pour BIOS et /boot/efi pour UEFI.

```bash
pacman -S grub efibootmgr dosfstools os-prober mtools
mkdir /boot/efi
mount /dev/sda1 /boot/efi
grub-install --target=x86_64-efi  --bootloader-id=arch_linux_uefi --recheck
```

Génération du fichier de conf de grub :

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

#### Initramfs

Génération de l'image du noyeau avec mkinitcpio. Ici utilisation de linux-zen, à remplacer en fonction du noyeau installé (voir tableau plus haut).

```bash
mkinitcpio -p linux-zen
```

Le système est maintenant installé, on peut quitter le chroot avec ```exit```, démonter le disque avec ```umount -R /mnt``` puis rebooter avec ```reboot```, sans oublier de retirer la clé USB d'installation.

Ici, le système est opérationnel, possibilité de s'arrêter si la machine est utilisée en tant que serveur et qu'il n'y a pas besoin d'interface graphique.

#### Réseau

Pas de client DHCP ici, on se connecte via une prise RJ45, le wi-fi sera géré plus tard, après avoir installé l'interface graphique.

```bash
ip link set enp0s3 up
ip addr add 192.168.1.50/24 dev enp0s3
ip route add 0.0.0.0/0 via 192.168.1.1
```

Editer ensuite le fichier /etc/resolv.conf (DNS) et ajouter :

```bash
nameserver 1.1.1.1
```

## Améliorations facultatives

Gestion de [AUR](https://wiki.archlinux.org/index.php/Arch_User_Repository) :

```bash
pacman -S base-devel
```

Activer les insultes lors de mauvaise saisie de mot de passe avec sudo :

```bash
visudo
# Ajouter la ligne suivante au fichier
Defaults insults
```

Installation de paquets utiles sur la plupart des machines :

```bash
pacman -S bzip2 unzip tar zip sed wget vi gawk vim coreutils dialog cpupower e2fsprogs neofetch file licenses htop
systemctl enable cpupower
```

Installation des manuels utilisateurs man :

```bash
pacman -S man-db man-pages
```

## Installation interface graphique

Installation de xfce4 et xfce4-goodies. xfce4-goodies contient des application par défaut dans xfce comme un calendrier, taskmanager, application de notes, météo... Liste des paquets [ici](https://www.archlinux.org/groups/x86_64/xfce4-goodies) :

```bash
pacman -S xfce4 xfce4-goodies gvfs xarchiver claws-mail galculator xscreensaver ffmpegthumbnailer evince libcanberra-{pulse,gstreamer} system-config-printer
```

Installation des drivers open source Intel et Nvidia :

```bash
pacman -S xf86-video-intel mesa
pacman -S xf86-video-nouveau
```

Alternative : installer les drivers Nvidia propriétaires :

 ```bash
pacman -S nvidia nvidia-utils nvidia-settings nvidia-dkms
```

Installation des drivers pour le touchpad :

```bash
pacman -S libinput # voir   ussi xf86-libinput
```

Utilisation de lightdm plutot que le xfwm en tant que window manager :

```bash
pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xorg
localectl set-x11-keymap fr # Eviter que le clavier soit qwerty au démarrage de la session
systemctl enable --now lightdm
```

#### Wi-fi

Débrancher l'interface RJ45 avant de configurer interface wi-fi pour éviter tout conflit. NetworkManager installe l'utilitaire nmcli.

```bash
pacman -S iw networkmanager
systemctl enable --now NetworkManager
ip link set wlo1 up
nmcli dev wifi connect Livebox-AAAA password monmotdepasse
```

#### Son et bluetooth

```bash
pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth pavucontrol bluez bluez-utils blueman alsa-utils
```

#### Gestion batterie

```bash
pacman -S tlp tlp-rdw
systemctl enable tlp
```

Pour entrer en hibernation en cas de panne de batterie, éditer /etc/udev/rules.d/99-lowbat.rules et ajouter les lignes suivantes :

```bash
# Suspend the system when battery level drops to 5% or lower
SUBSYSTEM=="power_supply", ATTR{status}=="Discharging", ATTR{capacity}=="[0-5]", RUN+="/usr/bin/systemctl hibernate"
```

## Paramétrer l'OS

#### Améliorer zsh

Voir le site [ohmyz.sh](https://ohmyz.sh).

#### Mise en place parefeu

#### Analytique

[Pkgstats](https://wiki.archlinux.org/index.php/Pkgstats) envoie des données anonymes au projet Arch et permet aux développeurs de prioriser leurs efforts de développement, en fonction des paquets installés par les utilisateurs.

```bash
pacman -S pkgstats
```

#### Applications de base/indispensables

```bash
pacman -S firefox code vlc net-tools git nmap
```

#### Spotlight / Indexeur

Albert est le spotlight de macOS pour Linux.

```bash
pacman -S albert
```

## Paramétrer et améliorer Xfce

#### Applications et plugins à installer

* **[redshift](https://wiki.archlinux.org/index.php/Redshift)** : jaunir l'écran la nuit
* **[xfce4-cpugraph-plugin](https://docs.xfce.org/panel-plugins/xfce4-cpugraph-plugin)** : afficher la charge CPU dans la barre des tâches
* **[Whisker Menu](https://docs.xfce.org/panel-plugins/xfce4-whiskermenu-plugin)** : menu d'applications amélioré
* **network-manager-applet** : gestion du wi-fi graphiquement
* **xfce4-pulseaudio-plugin** : gestion du son
* **xfce4-xkb-plugin** : changer facilement de clavier depuis la barre de menu

Terminal drop down + raccourci clavier

```
pacman -S redshift xfce4-cpugraph-plugin xfce4-whiskermenu-plugin network-manager-applet xfce4-pulseaudio-plugin xfce4-xkb-plugin
```

#### Raccourcis clavier et souris

Coins et bordures actifs.

#### Thèmes et icones

Le thème [arc-flatabulous-theme](https://github.com/andreisergiu98/arc-flatabulous-theme) compile mal des fois. Une copie de ce thème (3 thèmes en réalité) se trouve dans le dossier themes/arc-flatabulour-theme. Il suffit de copier ces 3 dossiers dans le répertoire /home/$USER/.local/share/themes/ et activer un de ces thèmes via les settings->appearance dans xfce.

Le dossier icons propose une icone d'Arch Linux, à placer en icone du menu d'applications.

Le dossier wallpaper propose des fonds d'écran et le dossier desktop propose des idées de design pour xfce.

Liste thèmes :

* [Arc-flatabulous-theme](https://github.com/andreisergiu98/arc-flatabulous-theme)
* [Arc](https://github.com/horst3180/arc-theme) 

Liste icones :

* [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
* [Qogir Icon Theme](https://github.com/vinceliuice/Qogir-icon-theme)

## Aller plus loin

[Blackarch](https://blackarch.org) permet d'utiliser plein d'outils de tests d'intrusions sous Arch Linux.

## Sources

Les liens et sources qui m'ont servi lors de l'installation :

* [Installation page Arch Wiki](https://wiki.archlinux.org/index.php/Installation_guide)
* [Installation page Arch Wiki FR](https://wiki.archlinux.fr/Installation)
* [Frédéric Bezies page Github](https://github.com/FredBezies/arch-tuto-installation/blob/master/install.md)
* [Processus Thief vidéo Youtube](https://www.youtube.com/watch?v=ApLpOkStDYQ)
* [Installation Arch sur Razer Blade](https://rolandguelle.github.io/razer-blade-stealth-linux/arch-antergos.html)
* [Aussi une install sur Razer Blade](http://stephanhahn.ch/posts/arch-on-razerblade-2016)
* [Encore une install sur Razer Blade](https://bytee.net/reviews/razer-blade-15-advanced-2019-with-arch-linux)