# Notes about Samba server

[Samba](https://www.samba.org/) is an important component to seamlessly integrate Linux/Unix Servers and Desktops into Active Directory environments. It can function both as a domain controller or as a regular domain member.  

## Install and configure Samba  

### Step 1 - Install Samba  

Install samba package :  
```
apt update && apt install samba
```  

### Step 2 - Create samba users  

Add user without shell access :    
```
adduser username --shell /usr/sbin/nologin
```

Create group for this user :  
```
addgroup groupname
```

Add new user to this group :  
```
usermod -aG groupname user
```

Link Linux user with samba user :  
```
smbpasswd -a user
```

### Step 3 - Create directory for samba files

Withe the commands below you will create directory to put your futures samba files and give permission to the user you want.  

```
mkdir -p /srv/samba
chown -R user:user /srv/samba
chmod 755 -R /srv/samba
```

### Step 4 - Edit file conf

Edit **/etc/samba/smb.conf** to begin configuration.  

Add the following lines at the end of the file :  

```
[Repo_name]
comment = Some comment about the shared folder
path = /srv/samba/repo
valid users = user,user2
guest ok = no
writable = yes
browsable = yes
```

### Step 5 - Start Samba service

Start samba service :  
```
systemctl start smbd.service
```

Enable samba to start samba at boot :  
```
systemctl enable smbd.service
```

## Use Samba client

```
$ smbclient -N -L \\\\10.10.10.27\\
$ smbclient -N \\\\10.10.10.27\\backups
smb: \> dir
smb: \> get myfile.txt
```

* List all shares
* Connect to backup share
* List files
* Download file