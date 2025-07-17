## USER AND GROUP ADMINISTRATION 

In linux user is one who use the system, ther can be at least one or more than one user in linux at a time. Users on a system are identified by username and userId.
- Every user is assigned a unique User ID number (UID); UID 0 identifies root
- Users are assigned to groups Each group is assigned a unique Group ID number 
(gid)
- Users cannot read, write or execute each others' files without permission
- All users in a group can share files that belong to the group
- Every file is owned by a UID and a GID
- Every process runs as a UID and one or more GIDs ; Usually determined by who 
runs the process

#### Some important Points related to users:

| Type       | Example | User ID (UID)       | Group ID (GUID) | Home Directory | SHELL |
|:-----------|:---:|-----------:| :-----------:  | :-----------:  | :-----------:  |
| Super User |  root | 0   | 0  | /root  | /bin/bash  |
| System User|  ftp, ssh  | 1 to 999 | 1 to 999  | /var/ftp  | /sbin/nologin  |
| Normal user  | user | 1000 to 60000    | 1000 to 60000  | /home/user-name  | /bin/bash  |

**Super User (root):** He is administrator user.

**System User:** System user are the users created by softwares or applications. for example if you install apache it will create a user called apache. these kind of user called as system users.

**Normal User:** Normal user are the users created by root user. They are normal user like Pravin, trupti, pratulsh etc.

### Create a user

A syntax for creating a user in linux is

useradd `options` user-name and adduser `option` user-name

options are:
- -u user id
- -G Secondary group id
- -g primary group id
- -d home directory
- -c commit
- -s shell
