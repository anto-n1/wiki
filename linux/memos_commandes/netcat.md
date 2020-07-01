# Netcat

Ouvrir un listener :
```
nc -nvv -l -p 1234 -e /bin/bash
```

Se connecter à un listener :
```
nc 192.168.56.123 1234
```