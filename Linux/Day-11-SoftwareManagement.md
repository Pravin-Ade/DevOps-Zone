## SOFTWARE MANAGEMENT

To manage the software in Linux, below utilities are used 

__Ubuntu__ - apt \
__RHEL__ - rmp (RedHat Package Manager), yum (YellowDog updater modified), dnf\
__SUSE__ - zypper

__RPM - RedHat Package Manager__ \
RPM is a package manager system. RPM is a powerfull software management tool for installing, uninstalling, verifying, quering and updating software packages.
RPM is a straight forward program to perform the above software management tasks.

__Features:__
- RPM can verify software package
- RPM can be served as a powerfull serch engine to search for software's
- Software, components etc can be upgraded using RPM without having to reinstall them
- Installing, reinstalling can be done with ease using RPM
- During updates RPM handles configuration files carefully, so that's the cutomization is not lost

__1. To check all the installed packages in the system__ _rpm -qa_
__2 To check whether a perticular package is installed or not__ 
```
rpm -qa [packageName]
rpm -qa vsftpd
rpm -qa | grep -i <package Name>
```
__3. Check whether a packeage is consistent or not, before installing it (Testing the installation)__ \
- Move to the directory where you have kept the rpm package which you wish to install
- cd /var/ftp/pub/rhel8/Packages/
- Command - _rpm -ivh --test packageName_
