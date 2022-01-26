# USB Passthrough

USB devices are not available in WSL2 by default. To use usb devices in WSL they need to be attached using `usbip` that forwards usb traffic over IP on the virtual network interface between Windows and WSL.

## Prerequisites

- Windows 11 running a WSL2 distro (These instructions are for *Ubuntu*).
- WSL kernel 5.10.60.1 or higher. If lower, run `wsl --update` in a _administrator_ command prompt on windows to update.

## Setup

- Install the latest release of [usbipd-win](https://github.com/dorssel/usbipd-win/releases).
- Install the following packages on Ubuntu.
  ```zsh
  sudo apt install linux-tools-5.4.0-77-generic hwdata
  sudo update-alternatives --install /usr/local/bin/usbip usbip /usr/lib/linux-tools/5.4.0-77-generic/usbip 20
  ```
- In an *administrator* command prompt on Windows run the following command to list the usb devices.
  ```ps
  PS > usbipd wsl list
  ```
  ```
  BUSID  DEVICE                                                        STATE
  3-1    Xbox Kinect Audio, © 2011 Microsoft Corporation. All righ...  Not attached
  3-2    Xbox NUI Camera                                               Not attached
  ```
- Attach the required devices to wsl using the command below.
  ```ps
  PS > usbipd wsl attach --busid 3-1
  ```
- Check if the devices are now available in Ubuntu by running `lsusb`.
  ```
  Bus 001 Device 003: ID 045e:02ae Microsoft Corp. Xbox NUI Camera
  Bus 001 Device 002: ID 045e:02ad Microsoft Corp. Xbox NUI Audio
  ```

## Source

https://devblogs.microsoft.com/commandline/connecting-usb-devices-to-wsl/