# fedora-polarfeather-rice
My Linux ricing setup on minimal Fedora through the Fedora Everything netinstaller

## Prerequisites
- Device you are installing the Fedora distribution on
- Bootable USB with the Fedora Everything Netinstall ISO image
- Some knowledge about Linux
- And determination

If you do not have the USB with the ISO image, you can use [Rufus](https://rufus.ie/) to create the bootable USB. \
You can also get the Fedora Everything ISO image [here](https://fedoraproject.org/misc/#everything). \
Here is also a [guide](https://www.youtube.com/watch?v=FTi7A8C2q38) if you do need help with Rufus.

## 1. Installing via the netinstall
Plug the USB into your desktop/laptop and boot into BIOS, usually with the Esc or F2 key. \
Check your boot menu options and boot into the USB.

It may take a few minutes but you will enter the installation setup. Since this is installing packages via the network, make sure you have internet connection, either via Wi-Fi or ethernet, available. \
\
For my setup, I did:
- Connect via Wi-Fi
- Do automatic partitioning, removing existing partitions.
- (IMPORTANT) Custom build: With Standard, Common NetworkManager submodules and Headless Management
- Root account disabled

\
Then, just click Finish at the bottom right and wait for the install to finish.

## 2. Post-installation
