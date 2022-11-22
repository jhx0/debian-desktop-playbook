# debian-desktop-playbook
A Ansible Playbook to deploy/configure a Debian desktop system with Xfce and many additional packages.

## Features:
- Xfce Desktop environment
- Many additional packages
- Installs external applications: Ansible, Docker, VSCode
- Targets Intel/AMD systems
- gaming role with Steam, Wine and more
- Installs Libvirt/Qemu/Virt-Manager
- Basic firewall via IPTables

## Before running the Playbook:
- Configure **group_vars/all** to your need.
- In general: Select from **site.yml** what you need and comment out roles you don't want to run.
- Take a look at the **dotfiles** role, since you most likely want to use your own dots!

## Usage:
1. Clone/download this repository
2. Unpack/cd into the directory
3. Run
```
$ ansible-playbook -i hosts site.yml -Kk
```
4. The target will reboot when the playbook is finished running
5. Done

## Note:
Make sure you have set the correct IP/Hostname in the **hosts** file.   
Take a look at the provided roles in the **site.yml** file!

**BEWARE:** do **_NOT_** run this Playbook blindly!
