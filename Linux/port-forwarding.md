## Port forwarding and port changing in RedHat Linux

### Port changing process:
Locate the service configuration file: Services usually have a configuration file where the port is defined. For example:

- Apache HTTP Server: /etc/httpd/conf/httpd.conf
- SSH: /etc/ssh/sshd_config

**Edit Configurations file:** Open the file using any test editor (ex. nano, vi, vim)

    netstat -tulnp | grep ssh - # run this cmd to check the existing port number for sshd service.

look for the line that specifies the port (port 22) and change it to your desired port number.

    vim /etc/ssh/sshd_config

**To update port use SELinux policies:** If SELinux is enable, we need to update its policy. 

    semanage port -a -t ssh_port_t -p tcp <new_port>

**Modify the firewall rules:** update firewall to alow traffic on the new port.

    firewall-cmd --list --all
    firewall-cmd --add-port=<New-port>/tcp --permanent
    firewall-cmd --reload

**Restart ther service:** Apply the changes by restarting the services.

    systemctl restart <service>
    systemctl restart sshd

**Verify connectivity:** Test the new port by connecting to it.

## Port forwarding



