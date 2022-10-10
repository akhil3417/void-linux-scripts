
# Table of Contents

1.  [This is how you can get pipewire up and running in void](#this-how-you)
    1.  [Install the essential package's](#install-essential-packages)
    2.  [Un-comment the following line in  /etc/pipewire/pipewire.conf](#un-comment-following)
    3.  [Create the follownig necessary symlinks in system](#create-follownig-necessary)
    4.  [Now we need to disable pulseaudio from auto spawn](#now-we-need)
    5.  [create in *etc/xdg/autostart* a pipewire.desktop file with the following contents:](#create-etc-xdg)



<a id="this-how-you"></a>

# This is how you can get pipewire up and running in void


<a id="install-essential-packages"></a>

## Install the essential package's

    sudo xbps-install libvirt bridge-utils libspa-bluetooth libjack-pipewire pamixer


<a id="un-comment-following"></a>

## Un-comment the following line in  /etc/pipewire/pipewire.conf

    #"/usr/bin/pipewire" = { args = "-c pipewire-pulse.conf" }


<a id="create-follownig-necessary"></a>

## Create the follownig necessary symlinks in system

    mkdir -p /etc/alsa/conf.d
    ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
    ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d


<a id="now-we-need"></a>

## Now we need to disable pulseaudio from auto spawn

-   Edit /etc/pulse/client.conf and replace the following lines :

    chnge autospawn = yes to autospawn = no


<a id="create-etc-xdg"></a>

## create in *etc/xdg/autostart* a pipewire.desktop file with the following contents:

    [Desktop Entry]
    Version=1.0
    Name=Pipewire
    Comment=Start Pipewire
    Exec=/usr/bin/pipewire
    Terminal=false
    Type=Application
    X-GNOME-Autostart-Phase=Initialization
    X-KDE-autostart-phase=1

