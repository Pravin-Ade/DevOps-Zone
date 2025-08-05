## INTRODUCTION TO FIREWALLD

Firewall is a device that allow multiple networks to communicate with one another according to a defined security policy.

__Q 1. To check the status of firewald__
```
sudo firewall-cmd --state
```
__Q 2. To check the list of trusted services and ports in firewalld__
```
sudo firewall-cmd --list-all
```
__Q 3. To add a service into trusted list permanently__
```
firewall-cmd --add-service=ftp --permanent
firewall-cmd --reload
```

__Q 4. To remove the service from firewall trusted list permanently__
```
sudo firewall-cmd --remove-service=ftp --permanent
sudo firewall-cmd --reload
```
__Q 5. To add a port into firewall trusted list permanently__
```
sudo firewall-cmd --add-port=21/tcp --permanent
sudo firewall-cmd --reload
```

### To add or remove multiple services/ports in firewall use following command
```
sudo firewall-cmd --add-service=1st-service --add-service=2nd-service --permanent
sudo firewall-cmd --reload

sudo firewall-cmd --add-service=portID/Protocol
sudo firewall-cmd --reload
```
