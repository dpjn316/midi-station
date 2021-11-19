# You can change the user name before installing ubuntu server
`cat /etc/passwd`

# Configuring the keyboard layout
`sudo dpkg-reconfigure keyboard-configuration` 

`sudo reboot now`

# Configuring the timezone
`sudo dpkg-reconfigure tzdata` 

# Configuring network tools
`sudo apt install net-tools`

`arp -na`

# Wifi configuration
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

# Change hostname
`sudo vi /etc/hostname` 

`sudo reboot now`

# Check shells
`cat /etc/shells`

# Make an executable file
`chmod  u+x myscript.sh`

# Installing midi utils
`sudo apt update`

`sudo apt upgrade` 

`sudo apt-get install puredata`

`sudo apt-get install jackd2`

`sudo apt install alsa-utils`

`sudo apt install sox`

`sudo apt-get install fluidsynth`

`sudo apt-get install fluid-soundfont-gm`

`sudo reboot`

# Checking permissions
`grep audio /etc/group`

`echo -n performance`

`groups`

`sudo vim /etc/security/limits.d/audio.conf`

`cat /proc/asound/cards`

`aplaymidi -l`

# Creating a boot script
`/etc/init.d/`

