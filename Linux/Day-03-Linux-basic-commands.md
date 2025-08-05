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

### Find
Find command is used to search for files and directories. \
**syntax:** find [path] [options] [expression]

**path:** Where to start searching (e.g., /, .) \
**options:** How to search (name, type, size, etc.) \
**expression:** What to do (print, delete, exec)

1. **Find only directories** - *find /etc/apt -type d*
2. **Find only files** - *find /etc/apt -type f*
3. **Find file by name** - *find / -name new.txt*
4. **Find Directory by name** - *find /etc/apt/ -type d -name tru*.d
5. **Find file based on size** - *find /var -type d -size 1M*
6. **Find directory that are greater than 100MB in the / directory** - find / -type d -size +100M
7. **find file by size range** - find / -type f -size +1k -size -10k
8. **Find files by permission** - find / -type f -perm 664
9. **Find files by modification time** - find ~/ -type -f -mtime 5
10. **Find hidden file:** - find . -type -f -name '.*'
11. **Find text in files** - find . -name "*.txt" -exec grep 'book' {} \; or find . -name "*.txt" -exec grep -H "book" {} \;
12. **find and Delete the Matching Files** - find . -name "*.txt" -exec grep -l "chai" {} \; -exec rm -rf {} \;


### SED
1. Update specific line to the file
   ```
   sed -i '2s/.*/This is change/' file.txt
   ```
2. Replace word in file
   ```
   sed -i 's/Ubuntu/Linux/g' greet.txt
   ```
3. Add line top of the file
   ```
   sed -i '1iThis is first line added by sed command' greet.txt
   ```
4. How do you check if a file exist and then write to it only if it exist?
   ```
   if [ -f greet.txt ]; then
     echo "Hello! This line has been added by if condition" > greet.txt
   fi
   ```

### tee
1. read file, process it and save it
   ```
   cat /etc/passwd | tee file.txt
   ```
   

