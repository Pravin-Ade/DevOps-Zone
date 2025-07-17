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

cat, echo, awk, pwd, cd, ls, find, cp, mv, tar, gzip, chage, cpio, lsof, grep, iostat, journalctl, lscpu, lsmem, lshw, netstat, rsync


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

