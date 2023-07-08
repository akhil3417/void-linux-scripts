


# Why pipewire

-   [Pipewire](https://pipewire.org/) is a server and user space API to deal with multimedia pipelines.It
    provides a low-latency, graph based processing engine on top of audio and
    video devices that can be used to support the use cases currently handled by
    both pulseaudio and JACK. PipeWire was designed with a powerful security model
    that makes interacting with audio and video devices from containerized
    applications easy. Nodes in the graph can be implemented as separate
    processes, communicating with sockets and exchanging multimedia content using
    fd passing. PipeWire was created by [Wim Taymans](https://gitlab.freedesktop.org/wtaymans) , Principal Engineer at Red Hat and co-creator of the GStreamer multimedia framework.
    -   Key features of PipeWire include:
        -   Capture and playback of audio and video with minimal latency.
        -   Real-time Multimedia processing on audio and video.
        -   Multiprocess architecture to let applications share multimedia content.
        -   Seamless support for PulseAudio, JACK, ALSA and GStreamer applications.


# How to install and configure pipewire in void linux


## Install the essential package's

    sudo xbps-install libvirt bridge-utils libspa-bluetooth libjack-pipewire pamixer
    
- You might need elogind as well


## Un-comment the following line in  /etc/pipewire/pipewire.conf in section context.exec

-   Should be at bottom of file

    #"/usr/bin/pipewire" = { args = "-c pipewire-pulse.conf" }


## or if you want to use wireplumber

-   install wireplumber via package manager
-   comment all other options in context.exec section and add this

    { path = "/usr/bin/wireplumber" args = "" }


## Create the following necessary symlinks in system

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
    Icon=pipewire
    Comment=Start Pipewire
    Exec=/usr/bin/pipewire
    Terminal=false
    Type=Application
    NoDisplay=true
    X-GNOME-Autostart-Phase=Initialization
    X-KDE-autostart-phase=1


## Other resources about pipewire

-   <https://github.com/mikeroyal/PipeWire-Guide>
-   <https://wiki.archlinux.org/title/PipeWire>

