# debian-desktop-playbook
A **Ansible** **Playbook** to deploy/configure a **Debian** desktop system with **Xfce**/**Gnome**/**KDE** and many additional packages.

Adapted for **Debian 12** (**Bookworm**)

## Features:
- **Xfce** desktop by default.
- Many additional packages (**LibreOffice**, **LaTex**, **Firefox**, **Docker** etc.)
- Installs external applications: **VSCodium**, **Element**, **Virtualbox**, **Brave**, **Mullvad (Client)**, **Signal**, **Vagrant**, **Raspberry Pi Imager**)
- Gets the current **JDownloader** setup for offline install
- Gaming: **Steam**, **Wine** and retro gaming emulators (**Mupen64Plus**, **Mednafen/Mednaffe**)
- Targets **Intel**/**AMD** systems (CPU/GPU)
- Virtualization packages (**libvirt/QEMU/Virt-Manager**)
- **Flatpak** installed by default (With one Flatpak: **Firefox**)
- Almost everything comes from the main repos!

## Hint
This Playbook mainly servers my own needs - feel free to adapt it to yours!

You can find many more variables under the **vars** directory - Make sure you take a look before running the **Playbook**. (So you can customize your install)

The **dotfiles** tasks installs my own config files. This might not be what you need - be sure to exclude the **role** when not needed. (This can be done via **tags**)

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
$ ansible-playbook main.yml --tags "apt,vim,sysctl,grub,reboot" (-Kk)
```
3. Run only one task
```bash
$ ansible-playbook main.yml --tags "vscodium" (-Kk)
```
All available **Tags**:
```bash
apt
upgrade
vim
dotfiles
postfix
sshd
sudo
groups
ntp
sysctl
grub
fstrim
fail2ban
xorg
xfce
packages
fontconfig
gaming
flatpak
rpi-imager
jdownloader (Download setup only)
vscodium (external)
element (external)
virtualbox (external)
brave (external)
mullvad (external)
signal (external)
powershell (external)
vagrant (external)
reboot
```

## Note:
Make sure you have set the correct IP/Hostname in the **hosts** file.   

**BEWARE:** do **_NOT_** run this Playbook blindly!
