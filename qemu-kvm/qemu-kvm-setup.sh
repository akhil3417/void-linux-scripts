#!/usr/bin/env sh

##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################
##################################################################################################################
echo
tput setaf 2
echo "################################################################"
echo "################### Installing virt-manager and bridge-utils"
echo "################################################################"
tput sgr0
echo

sudo xbps-install libvirt bridge-utils

echo
tput setaf 3
echo "################################################################"
echo "################### Making Kvm run without root access "
echo "################################################################"
tput sgr0
echo

sudo sed -i "s/#user = \"root\"/user = \"$(id -un)\"/g" /etc/libvirt/qemu.conf
sudo sed -i "s/#group = \"root\"/group = \"$(id -gn)\"/g" /etc/libvirt/qemu.conf
sudo usermod -a -G kvm $(id -un)
sudo usermod -a -G libvirt $(id -un)
sudo ln -s /etc/sv/libvirtd /var/service
sudo ln -s /etc/apparmor.d/usr.sbin.libvirtd /etc/apparmor.d/disable/

echo
tput setaf 3
echo "################################################################"
echo "###################  Making network available with AppArmor enabled"
echo "################################################################"
tput sgr0
echo
wget https://gitlab.com/apparmor/apparmor/-/raw/master/profiles/apparmor.d/usr.sbin.dnsmasq -O ~/usr.sbin.dnsmasq
sudo mv ~/usr.sbin.dnsmasq /etc/apparmor.d/

# Now, to modify the main profile, you will have to add a r at the end of the line about libvirt_leaseshelper , so it will be like: /usr/libexec/libvirt_leaseshelper mr,.

sudo sed -i "s/\/usr\/libexec\/libvirt_leaseshelper m,/\/usr\/libexec\/libvirt_leaseshelper mr,/g" /etc/apparmor.d/usr.sbin.dnsmasq

# Create libvirt.conf
mkdir -p ~/.config/libvirt
echo "uri_default = \"qemu:///system\"" >> ~/.config/libvirt/libvirt.conf
