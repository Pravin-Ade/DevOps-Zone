## Managing Installed Services

Services are programs (called daemon) that once started ruun continuously in the background.

### Introduction To _systemd_ and _systemctl_ command in RHEL7/8/9

Systemd is a system and service manager for Linux OS

| Runlevel | Systemd Description |
|----------|----------|
| 0 | Poweroff.target |
| 1 | rescue.target |
| 2 | multi-user.target |
| 3 | multi-user.target |
| 4 | multi-user.target |
| 5 | graphical.target |
| 6 | reboot.target |

### systemctl commands

| Systemctl | Systemctl Description |
|----------|----------|
| Systemctl status name | Check if a service is enabled |
| Systemctl enable service | Enable a service|
| Systemctl disable service | Disable a service |
| Systemctl is-enable | Check if a service is enabled |

Q.1 How to check status of any service (here vsftpd service we checked)
```
sudo systemctl status vsftpd
```
Note: reload the service, may be required after doing some change in config file. _systemctl restart vsftpd_
      To restart any service after when reload doesnot work

Q 2. How to stop vsftpd service
```
sudo systemctl stop vsftpd
```
Q 3. How to check service avaiilability
```
sudo systemctl status vsftpd.service
```
Q 4. Make the service enable at boot for vsftpd
```
sudo systemctl enable vsftpd.service
sudo systemctl is-enable vsftpd.service
```

Q 5. How to start and enable service at the same time
```
sudo systemctl enable vsftpd --now
```

Q 6. How to disable and stop at the same time
```
sudo systemctl disable vsftpd --now
```


