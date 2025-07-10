# debian-desktop-playbook
A personal **Ansible** **Playbook** to deploy/configure a **Debian** desktop system to my needs with **KDE** (**Xfce** is also available) and many additional packages.

Adapted for **Debian 12** (**Bookworm**)

## Features:
- **KDE** desktop by default enabled and **Xfce** (**Task**) available.
- Many additional packages from the official repos (**LibreOffice**, **Firefox-ESR**, etc.)
- Installs and configures **sudo** and **doas** (**opendoas**)
- **Flatpaks**: **Discord**, **Element**, **Signal**, **Raspberry Pi Imager**, **JDownloader**
- External applications available: **Docker**, **Virtualbox**, **Mullvad (Client)**, **VSCodium**, **Brave**, **VeraCrypt**
- Gaming: **Steam**, **Wine**, **Minecraft**  and retro gaming emulators (**Mupen64Plus**, **Mednafen/Mednaffe**)
- Targets **Intel**/**AMD** systems (CPU/GPU)
- Virtualization packages (**libvirt/QEMU/Virt-Manager**)
- Also installs **PowerShell**
- Installs **Mono** / **.NET SDK**
- Install the **Liquorix** Linux Kernel
- Install the **XanMod** Linux Kernel (**LTS**)
- (**Optional**) Installs and sets up **UFW** (**Deny** incoming, **Allow** outgoing, allow **SSH** access)
- Most software comes from the main repos!

## Note on external applications:
External applications are only installed when the "external" variable is set to true.   
Keep that in mind when using this **Playbook**.   
I made the decision to make these not be installed by default since I personally perefer things from the official repo or installed as a **Flatpak**.

## Screenshot:
![xfce](https://github.com/jhx0/debian-desktop-playbook/assets/37046652/f1cdcc0e-d681-47eb-9587-3f80acd9cbbb)

There is nothing big to see here. I like the defaults and don't really change much of anything. YMMV. 😎   
(**Xfce** desktop pictured here - if you must have a screenshot)

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
$ ansible-playbook main.yml --tags "flatpak" (-Kk)
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
doas
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
fonts
gaming
vscode
pipx
firewall
docker
liquorix (external)
xanmod (external)
veracrypt (external)
flatpak (Multiple Flatpaks installed)
virtualbox (external)
brave (external)
mullvad (external)
powershell (external)
reboot
```

## Note:
Make sure you have set the correct IP/Hostname in the **hosts** file.   

**BEWARE:** do **_NOT_** run this Playbook blindly!

## Ubuntu
Certain tasks will run on **Ubuntu** and **Ubuntu** based systems.
Beware though that this **Playbook** was not tested on any **Ubuntu** system!
Make sure to check the tasks to see what they actually do before running this on any **Ubuntu** based system!
