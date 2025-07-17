### ENHANCE USER SECURITY WITH SUDO

- Restricts access to sensitive commands.
- Logs all sudo commands (accountability).
- Can grant specific permissions to specific users.
- Avoids full root login—safer and more controlled.

e.g. sudo apt update, sudo rpm -Uuvh *.rpm, sudo systemctl restart nginx, etc.

- The file **/etc/sudoers** file has the rules that users have to follow when using sudo command. That means that whatever commands access is provided to any user in
**/etc/sudoers** file, that user can only run those commands.
- Always use **visudo** to edit sudo configuration files.
- Set default editor: vim ~/.bashrc, add this **export EDITOR=vi** bottom at the bottom and reload profile using **source ~/.bashrc**

what is **root ALL=(ALL) ALL**

This lines means that the user root can execute from ALL terminals, acting as ALL (any) users, and run ALL (any) command.

So the first part is the user, the second is the terminal from where the user can use
sudo, the third is as which user he may act, and the last one, is which commands he
may run.

        ALL  ALL=(ALL:ALL) ALL 

        General Syntax:
        <user or group> <host> = (<runas_user>:<runas_group>) <command>


| Part         | Meaning                                                                                                                                          |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ALL` (1st)  | **Which users this rule applies to**. If it's in a group section, it's the group of users.                                                       |
| `ALL` (2nd)  | **Which host(s)** the rule applies to. Usually `ALL`, since most systems aren't clustered.                                                       |
| `(ALL:ALL)`  | **Runas Specification**:<br>`(user:group)`<br> - First `ALL`: allowed to run as **any user**<br> - Second `ALL`: allowed to run as **any group** |
| `ALL` (last) | **Which command(s)** can be run – in this case, **any command**                                                                                  |
