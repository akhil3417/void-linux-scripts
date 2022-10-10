


# How to install and configure pipewire in void linux


## Install the essential package's

    sudo xbps-install libvirt bridge-utils libspa-bluetooth libjack-pipewire pamixer


## Un-comment the following line in  /etc/pipewire/pipewire.conf

    #"/usr/bin/pipewire" = { args = "-c pipewire-pulse.conf" }


## Create the follownig necessary symlinks in system

    mkdir -p /etc/alsa/conf.d
    ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
    ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d


## Now we need to disable pulseaudio from auto spawn

-   Edit /etc/pulse/client.conf and replace the following lines :

    chnge autospawn = yes to autospawn = no


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

