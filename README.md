# debian-desktop-playbook
A **Ansible** **Playbook** to deploy/configure a **Debian** desktop system with **Xfce** and many additional packages.

## Features:
- **Xfce** desktop environment (Basic desktop)
- Many additional packages (**LibreOffice**, **LaTex**, **Firefox**, etc.)
- Installs external applications: **Ansible**, **Docker**, **VSCodium**, **Vagrant**, **Google Chrome**
- Targets **Intel**/**AMD** systems
- Gaming: **Steam**, **Wine** and more
- Installs **Libvirt**/**QEMU**/**Virt-Manager**
- By default: Only **FOSS** software will be installed! **No** **nonfree**/**contrib** packages! (You can change this)
- ...and much more!

## Hint
If you want to install nonfree software like **Steam** for example, you need to edit/set the **nonfree** variable which is defined in **vars/nonfree.yml**   
```yaml
nonfree.yml:
nonfree: true
```
Also: AMD GPU's use firmware to work. In this case you need to specify 
```yaml
gpu.yml: 
gpu_amd: true
...
nonfree.yml:
gpu_firmware_amd: true
```

You can find many more variables under the **vars** directory - Make sure you take a look before running the **Playbook**. (So you can customize your install)

The **dotfiles** tasks installs my own config files. This might not be what you need - be sure to exclude the role when not needed. (This can be done via **tags**)

## Before running the Playbook:
- Set the variables you need
- Take a look at the **dotfiles** role, since you most likely want to use your own dots!

## Usage:
1. Clone/download this repository
2. Unpack/cd into the directory
3. Run
```shell
$ ansible-playbook main.yml (-Kk)
```
4. The target will reboot when the playbook is finished running
5. Done

## Examples
All tasks can be selected via **Tags**, so you can pick whatever tasks you want to run.   
Following, a couple of use cases:
1. Run all tasks
```bash
$ ansible-playbook main.yml --tags all (-Kk)
```
2. Only run a subset of tasks
```bash
$ ansible-playbook main.yml --tags "apt,vim,rsyslog,sysctl,grub,reboot" (-Kk)
```
3. Run only one task
```bash
$ ansible-playbook main.yml --tags "steam" (-Kk)
```
All available **Tags**:
```bash
apt
upgrade
vim
dotfiles
postfix
rsyslog
sshd
sudo
pam
groups
ntp
sysctl
grub
fstrim
fail2ban
microcode (non-free)
xorg
gpu (non-free)
xfce
packages
fontconfig
laptop
libvirt
lxc
emulator
wine (non-free)
steam (non-free)
ansible
docker
vscodium
vagrant
chrome (non-free)
reboot
```

## Note:
Make sure you have set the correct IP/Hostname in the **hosts** file.   

**BEWARE:** do **_NOT_** run this Playbook blindly!
