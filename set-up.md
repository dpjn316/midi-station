## You can change the user name before installing ubuntu server
`cat /etc/passwd`

## Configuring the keyboard layout
`sudo dpkg-reconfigure keyboard-configuration` 

`sudo reboot now`

## Configuring the timezone
`sudo dpkg-reconfigure tzdata` 

## Configuring network tools
`sudo apt install net-tools`

`arp -na`

## Wifi configuration
`sudo vim /etc/netplan/50-cloud-init.yaml`


```
network:
    ethernets:
        eth0:
            dhcp4: true
            optional: true
    wifis:
        wlan0:
            dhcp4: true
            optional: true
            access-points:
                "your home network":
                    password: "password" 
                "your office network":
                    password: "password"
    version: 2
 
```


`sudo netplan apply`

`sudo reboot`

## Change hostname
`sudo vi /etc/hostname` 

`sudo reboot now`

## Check shells
`cat /etc/shells`

## Make an executable file
`chmod  u+x myscript.sh`

## Logging into /var/log
`sudo ./auto-connect-midi-interface.sh`

## Installing midi utils
`sudo apt update`

`sudo apt upgrade` 

`sudo apt-get install puredata`

`sudo apt-get install jackd2`

`sudo apt install alsa-utils`

`sudo apt install sox`

`sudo apt-get install fluidsynth`

`sudo apt-get install fluid-soundfont-gm`

`sudo reboot`

## To create deamon on linux
- Go to `/etc/systemd/system`
- Create a file `vim auto-connect-midi-interface.service` with this content:

```
[Unit]
Description=Auto connect a midi interface

[Service]
ExecStart=/bin/bash /usr/sbin/auto-connect-midi-interface.sh

[Install]
WantedBy=multi-user.target
```

- Copy sh file `auto-connect-midi-interface.sh` to `/usr/sbin/'
- Run `sudo systemctl enable auto-connect-midi-interface`
- Run `systemctl start auto-connect-midi-interface`
- Run `systemctl status auto-connect-midi-interface`

## Checking permissions
`grep audio /etc/group`

`echo -n performance`

`groups`

`sudo vim /etc/security/limits.d/audio.conf`

`cat /proc/asound/cards`

`aplaymidi -l`

## Creating a boot script
`/etc/init.d/`

