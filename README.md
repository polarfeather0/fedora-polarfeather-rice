# fedora-polarfeather-rice (WIP)
My Linux ricing setup on minimal Fedora through the Fedora Everything netinstaller, with Niri and Noctalia shell.  
This is mainly for my own reference but I am just posting here in case anybody is doing something similar and needs some guidance.

*Note: Most of this is based on a laptop (Lenovo 300e Chromebook).  
Some steps may require workarounds or may not be applicable to your setup.*

## Prerequisites
- Device you are installing the Fedora distribution on
- Bootable USB with the Fedora Everything Netinstall ISO image
- Some knowledge about Linux
- And determination

If you do not have the USB with the ISO image, you can use [Rufus](https://rufus.ie/) to create the bootable USB. \
You can also get the Fedora Everything ISO image [here](https://fedoraproject.org/misc/#everything). \
Here is also a [guide](https://www.youtube.com/watch?v=FTi7A8C2q38) if you do need help with Rufus.

## 1. Installing via the netinstall
Plug the USB into your desktop/laptop and boot into BIOS, usually with the ESC or F2 key. \
Check your boot menu options and boot into the USB.

It may take a few minutes but you will enter the installation setup. Since this is installing packages via the network, make sure you have internet connection, either via Wi-Fi or ethernet, available. \
\
For my setup, I did:
- Connect via Wi-Fi
- Automatic partitioning, removing existing partitions
- **(IMPORTANT)** Fedora Custom OS with these additional software: 
  - Standard
  - Common NetworkManager submodules 
  - Headless Management
- Root account disabled

\
Then, just click "Begin Installation" at the bottom right and wait for the install to finish.

## 2. Post-installation
### Wi-Fi troubleshooting
If you are connecting to Wi-Fi, you might face problems trying to connect to Wi-Fi.  
Check whether you are having Wi-Fi issues with `nmcli device`. If you are only seeing `loopback`, that means you have problems connecting to Wi-Fi.  
\
My issue when doing the installation was mainly due to missing firmware packages so I will go through that.  
\
Firstly, you need to download some firmware packages and copy them onto a **DIFFERENT** USB stick.  
These are the packages I had to install:
- `iwlwifi-mld-firmware`
- `iwlwifi-mvm-firmware`
- `iwlbluetooth-firmware`

After that plug the USB into the device, and get ready to mount it.  
Use `lsblk`, and check the name of the USB drive label (e.g. sda1).  
\
After that, mount it to either `/mnt` or `/media` with: 
```bash
sudo mount /dev/name-of-usb-label /mnt
# e.g. sudo mount /dev/sda1 /mnt
```
Go to the directory with: 
```bash
cd /file/path/to/location/you/mounted/the/drive
# e.g. cd /mnt
``` 
And run:
```bash
sudo rpm -ivh --nosignature ./*.rpm
```
This will install the required firmware packages and allow you to connect to Wi-Fi.  
After that, reboot the system with `reboot`. You should now be able to connect to Wi-Fi.  

### Cloning the repo and using the install script
Run:
```bash
sudo dnf install git
# May require reboot to use git
```
After installation, `cd` to its directory.  Make the install script executable with:
```bash
chmod +x install.sh
```
And run:
```bash
./install.sh
```
This script will add a lot of configurations and packages needed.  
Check `package-list.txt` and the `config` folder for more details.  
`reboot` after the script is done. You may delete this repository after the script has finished.

## 3. Conclusion
Of course, I am still working on this and I may be slow with updates due to schoolwork. Rest assured I will try update this when I have the free time to do so. For now, enjoy!
