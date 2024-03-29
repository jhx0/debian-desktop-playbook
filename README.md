# debian-desktop-playbook
A personal **Ansible** **Playbook** to deploy/configure a **Debian** desktop system to my needs with **KDE** or **Xfce** and many additional packages.

Adapted for **Debian 12** (**Bookworm**)

## Features:
- **KDE (Plasma)** or **xfce** desktop - you can select which one you like (Default is **KDE**).
- Many additional packages (**LibreOffice**, **LaTex**, **Firefox**, **Docker** etc.)
- Installs external applications: **VSCodium**, **Element**, **Virtualbox**, **Brave**, **Mullvad (Client)**, **Signal**, **Vagrant**, **Raspberry Pi Imager**)
- Gets the current **JDownloader** setup for offline install (Stored in **$HOME**)
- Gaming: **Steam**, **Wine** and retro gaming emulators (**Mupen64Plus**, **Mednafen/Mednaffe**)
- Targets **Intel**/**AMD** systems (CPU/GPU)
- Virtualization packages (**libvirt/QEMU/Virt-Manager**)
- **Flatpak** installed by default (With one Flatpak: **Firefox**)
- Almost everything comes from the main repos!

## Screenshot:
![debian](https://github.com/jhx0/debian-desktop-playbook/assets/37046652/436bb3f7-011b-498b-8de4-5b35aade3a7f)

There is nothing big to see here. I like the defaults and don't really change much of anything. YMMV. 😎
(Default **KDE** desktop pictured here - if you must have a screenshot)

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
kde
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

## Ubuntu
Certain tasks will run on **Ubuntu** and **Ubuntu** based systems.
Beware though that this **Playbook** was not tested on any **Ubuntu** system!
Make sure to check the tasks to see what they actually do before running this on any **Ubuntu** based system!