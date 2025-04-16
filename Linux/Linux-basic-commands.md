## Filesystem hierachy

| Mount       | Short Discription |
|:-----------|:---:|
| /   | This is top level directory, It is parent directory for all other directories |
| /root | It is home directory for root user |
| /home  | It is home directory for other users |
| /boot  | It contains bootable files for linux like initrd, GRUB. |
| /etc   | It contains all configuration files e.g. /etc/passwd, /etc/shadow |
| /usr | Default software installed to this path |
| /opt | Common location for third-party application files.|
| /bin | It contains commands used by all users |
| /sbin | It contains commands used by only super user (root)|
| /dev | It contains device files e.g. /dev/hda |
| /proc | Currently running kernel-related processes, including device |
| /var | It contain variable data like mails, log files |
| /tmp | Contains the temporary files for small period of time |
| /mnt | Default mount point for any partition |
| /media | It contain all removable media like CD-Drive, pendrive |
| /lib | It contain library fils which which are used by OS |

## Linux Basic Commands
**Creating, Removing, Copying, Moving files and Directories**

cat, echo, awk, pwd, cd, ls, find, cp, mv

## Users/Group

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

## Standard I/O and Pipes

**Standard Input and Output**
Linux Provides three I/O channels to Programs

- Standard Input (STDIN)
- Standard output (STDOUT)
- Standard Error (STDERR)

Redirecting Output...

- `> redirect STDOUT to file`
- `2> Redirect STDERR to file`
- `&> Redirect all output to file`
- `2>&1 Redirect STDERR to STDOUT`

**Example:**

    find /etc -name passwd > find.out
    find /etc -name passwd 2> /dev/null
    find /etc -name passwd > find.out 2> find.err

File contents are overwritten by default. >> Appends

    find /home >> find.out

Redirecting to multiple targets (tee)

    ls -l | tee listing | wc -l

Stores *STDOUT* of `ls` in listing then `pipes` to word count (wc)

