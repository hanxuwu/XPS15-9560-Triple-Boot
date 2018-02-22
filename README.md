# XPS15-9560-Triple-Boot  
Dell XPS15 9560 triple-boot with MacOS  Pop_OS  Win10 Tutorial  

## System Hardware Configuration  

- CPU: Intel Core i7-7700HQ (2.8-3.8 GHz)​  
- GPU: Intel HD Graphics 630 (GTX 1050 disabled)​  
- RAM: 32GB DDR4 2400MHz​  
- Storage: 1TB NVMe Toshiba XG4 THNSN51T02DUK​  
- Display: 4K Touch, 100% AdobeRGB​  
- Audio: Realtek ALC298 (ALC3266 according to Dell)​  
- Wireless: Dell Wireless 1830 (DW1830)*​ (The original Wireless card is Killer1535)  
- Battery: 97Wh (8.2Ah @ 12V)​  
- Thunderbolt 3: Intel JHL6240​  



## Things that don't work  
### in MacOS  
1. Trackpad: Three fingers and Four fingers gesture   
2. Hibernate(Could not wake up,need reboot)
3. SD Card(No drive)
4. Thunderbolt hot plug(could not read usb after hot pluging)  
5. GTX1050  
6. BlueTooth(intermittence while using the headset) 

### in Pop_OS  

1. SD Card  

## Things that work  
__*Everything else!*__  

# Prepare the Installation (in Windows)  

1. Update SSD firmware to the latest(use DELL support)  
2. Update BIOS to v1.7.0  
3. Set the SATA Operation from Raid0 to AHCI(without break Windows boot​)  
    - i. win+R
    - ii. input `msconfig`
    - iii. tick `safeboot` click `OK`  
![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/safeboot.PNG)  
    - iv. reboot press F12 into bios setting  and set to SATA Operation (AHCI)  
    - v. save and reboot into the sateboot system  
    - vi. repeat i,ii then unchecking the `safeboot` click `OK`  
4. get OS X onto a USB drive:
    - i. Download `macOS High Sierra 10.13.3(17D47) Installer with Clover 4391.dmg`((5,244,275,955 bytes))  
    - ii. run TransMac as administratotr  
    - iii.right click the U disk `format the udisk` click yes then  `restore with disk Image`  choose the dmg downloaded and wait for about 10 minutes
    - iv. After restore if your could not see the `EFI partition`  follow step v ,otherwize follow step ix  
    - v. win+R then enter `cmd`  
    - vi. `diskpart`  
    - vii. input  
    `list disk`  
    `select Disk 1`  
    `list partiton`  
    `select Partition 1`  
    ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/diskpart.PNG)  
    - viii.use DiskGenius select the uDisk click `assign the drive letter`and `unhidden the current partition` then `save the changes`  
    - ix. now you could see the EFI partition in computer  open the EFI
    - x. replace the `CLOVER` with `MacOS/CLOVER`(offer by gunslinger23)  
    - Now you've got the OSX udisk
    


5. get Pop_OS onto a USB drive:   
     - i. Download `pop-os_amd64_nvidia_48.iso`((5,244,275,955 bytes))  from https://system76.com/pop (*1.76 GB (Intel/AMD) does't work*)
     - ii. download Etcher from https://etcher.io/ then follow the install instruction http://pop.system76.com/docs/install-pop-os/ to make bootable drive  

     ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/etcherflashselected.png)  

6. get Win10 onto a USB drive:  
    - i. In __Windows__ environment: just download the ultraISO burn images to USB drives,then you get the the win10 boot disk. If you could only access to ubuntu follow the step ii.
    - ii. In __Ubuntu__  environment(It's quite useful,in case you have problem with installing windows)  
    - iii.Install gparted  
    `sudo apt-get install gparted`  
    `sudo gparted`  
    - iv. unmount the U drive  
    ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/umount.png)  
    - v. install woeusb make win10 boot  
    `sudo add-apt-repository ppa:nilarimogard/webupd8`  
    `sudo apt update`  
    `sudo apt install woeusb`  
     ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/woeusbgui.png)  

7. BIOS Settings (only relevant settings listed):  (offer by KNNSpeed)  
    a. General  
        &ensp;&ensp;i. System Information  
            &ensp;&ensp;&ensp;&ensp;1. Check that Video Memory is already 64MB (scroll down to the bottom)​  
        &ensp;&ensp;ii. Advanced Boot Options (all off, UEFI Network Stack might be fine either way)​  
    b. System Configuration  
&ensp;&ensp;i. SATA Operation (AHCI)  
&ensp;&ensp;&ensp;&ensp;1. Will break Windows boot​  
&ensp;&ensp;ii. Drives (all on)  
&ensp;&ensp;iii. SMART Reporting (on)  
&ensp;&ensp;iv. USB Configuration (all on)  
&ensp;&ensp;v. Dell Type-C Dock Configuration (on)  
&ensp;&ensp;vi. Thunderbolt Adapter Configuration (all on, no security)  
&ensp;&ensp;vii. USB PowerShare (on)  
&ensp;&ensp;viii. Audio (all on)  
&ensp;&ensp;ix. Keyboard Illumination (whatever; this gets overridden by the F10 key)  
&ensp;&ensp;x. Touchscreen (on)   
&ensp;&ensp;xi. Miscellaneous Devices (all on except SD Card Read-Only Mode)​  
    c. Security  
&ensp;&ensp;i. CPU XD (on)​  
    d. Secure Boot  
&ensp;&ensp;i. Secure Boot Enable (disabled)​  
    e. Intel Software Guard Extensions  
&ensp;&ensp;i. Intel SGX Enable (Software-Controlled)​  
    f. Performance  
&ensp;&ensp;i. (Everything on/enabled)​  
    g. Power Management  
&ensp;&ensp;i. USB Wake Support  
&ensp;&ensp;&ensp;&ensp;1. (USB Wake Support = off)  
&ensp;&ensp;&ensp;&ensp;2. (Wake on Dell USB-C Dock = on)​  
&ensp;&ensp;ii. Wake on WLAN (off)  
&ensp;&ensp;iii. Block Sleep (off)​  
    h. Virtualization Support  
&ensp;&ensp;i. (Everything on)​  
    i. The rest is personal preference.​  
    
# Install MacOS  
1. boot macOSUtility
    - i. press F12 to boot from the Udisk then choose mac usb press`space`  
    - ii. choose the second one `boot macOS with selected option`  and wait for about 2 minutes  
    - iii. choose `Use English for the main language`  
    - iv. choose `Disk Utility`  
    - v. select `Toshiba XG4 THNSN51T02DUK`
    - vi. erase with selected `format:Mac OS Extended (Journaled)` and `GUID Partition Map`  
    - vii. Partition with selected `Mac OS Extended(Journaled)`  

        |    Partition    | size |  
        | -------       | ------: |  
        | Mac           |  256 |  
        | PopOs           |  128 |  
        | WIN10           |  512 |  
        | Ubuntu          |  80  |  
        | Res             |46.88 |  
    



























References:  
[1] KNNSpeed [Guide] Dell XPS 15 9560: 4K Touch, 1TB SSD, 32GB RAM, 100% AdobeRGB  
[2] gunslinger23/XPS15-9560-High-Sierra