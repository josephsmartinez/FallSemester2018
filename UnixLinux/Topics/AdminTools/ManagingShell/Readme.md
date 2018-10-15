# Managing the Shell Environment
Login scripts:
/etc/profile
/etc/profile.d/*
~/.profile
~/.bash_profile
Bash configuration:
/etc/bashrc
~/.bashrc
Logout script
~/.bash_logout
Search path for executables defined:
Globally in /etc/profile
Per user in ~/.profile or ~/.bash_profile
When setting a variable, they are typically local to that specific shell instance.
Use export to convert them to global
export MESG
Add the following command to your .profile to make this automatic:
set -o allexport
Aliases
Add these to the .bashrc to automate commands
alias ls='ls --color=auto'
alias ls='ls --color=auto -la'
unalias ls
Functions
Add to .bashrc to create custom command sets
Can combine multiple commands in to a single command
Example system status function:
To Begin

function sysinfo()
    {
    echo -e "\nKernel Information:" ; uname -a
    echo -e "\nOS Version:" ; cat /etc/centos-release
    echo -e "\nSystem Uptime:" ; uptime
    echo -e "\nMemory Utilization:" ; free -m
    echo -e "\nFilesystem Utilization:"; df -h
    }
Update /etc/skel/.bashrc to populate values for new users
*
