# Installer les vbox linux additions

Installation des VirtualBox Linux additions sur des machines virtualles Linux.

```
apt install make gcc dkms linux-source linux-headers-$(uname -r)
cd /media/cdrom0
sh VBoxLinuxAdditions.run
reboot
```
