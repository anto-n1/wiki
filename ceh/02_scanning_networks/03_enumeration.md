# Enumération

L'énumération consiste à obtenir des informations comme :

* extraction de noms d'utilisateurs à partir des emails
* extraction d'informations à partir mots de passes par défaut
* extraction de noms d'utilisateurs à partir d'SNMP
* extraction d'user groups depuis Windows
* brute force d'Active Directory
* extraction d'informations à partir des zones de transfert DNS

Les différents ports et services sont :

| Port            | Description                                  |
|-----------------|----------------------------------------------|
| TCP/UDP 53      | DNS zone transfert                           |
| UDP 161         | SNMP                                         |
| TCP/UDP 135     | Microsoft RPC Endpoint Mapper                |
| TCP/UDP 389     | LDAP                                         |
| UDP 137         | NetBIOS Name Service (NBNS)                  |
| TCP 139         | NetBIOS Session Service (SMB over NetBIOS)   |
| TCP/UDP 445     | SMB over TCP                                 |
| TCP/UDP 3268    | Global Catalog Service                       |
| TCP 25          | SMTP                                         |
| TCP/UDP 162     | SNMP Trap                                    |

