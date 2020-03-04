# Configurer SSH switchs et routeurs


```
(config)# 
```

ip ssh version 2
ip ssh authentication-retries 2
no ip domain-lookup
ip domain-name cisco.com

username Admin privilege 1 password 7 08DSDDZDZ021

line vty 5 15
 login local
 transport input ssh