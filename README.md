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
### In MacOS  
1. Trackpad: Three fingers and Four fingers gesture   
2. Hibernate(Could not wake up,need reboot)
3. SD Card(No drive)
4. Thunderbolt hot plug(could not read usb after hot pluging)  
5. GTX1050  
6. BlueTooth(intermittence while using the headset) 

### In Pop_OS  

1. SD Card  
2. HD630

## Things that work  
__*Everything else!*__  
- Triple-boot:  
![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/Tripleboot.jpg)  
- macOS High-sierra  
![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/systeminfo.png)  
- Pop_OS!(Ubuntu-based Operating System For Developers)  
![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/PopOs.gif)  

# Prepare the Installation (in Windows)  

1. Update SSD firmware to the latest(use DELL support)  
2. Update BIOS to v1.7.0  
3. Set the SATA Operation from Raid0 to AHCI(without break Windows boot​)  
    - i. win+R
    - ii. Input `msconfig`
    - iii. Tick `safeboot` click `OK`  
![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/safeboot.PNG)  
    - iv. Reboot press F12 into bios setting  and set to SATA Operation (AHCI)  
    - v. Save and reboot into the sateboot system  
    - vi. Repeat i,ii then unchecking the `safeboot` click `OK`  
4. Get OS X onto a USB drive:
    - i. Download `macOS High Sierra 10.13.3(17D47) Installer with Clover 4391.dmg`((5,244,275,955 bytes))  
    - ii. Run TransMac as administratotr  
    - iii.Right click the U disk `format the udisk` click yes then  `restore with disk Image`  choose the dmg downloaded and wait for about 10 minutes
    - iv. After restore if your could not see the `EFI partition`  follow step v ,otherwize follow step ix  
    - v. win+R then enter `cmd`  
    - vi. `diskpart`  
    - vii. Input  
    `list disk`  
    `select Disk 1`  
    `list partiton`  
    `select Partition 1`  
    ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/diskpart.PNG)  
    - viii.Use `DiskGenius` select the uDisk click `assign the drive letter`and `unhidden the current partition` then `save the changes`  
    - ix. Now you could see the EFI partition in computer  open the EFI
    - x. Replace the `CLOVER` with `MacOS/XPS15-9560-High-Sierra-from(gunslinger23)/CLOVER`(offer by gunslinger23)  
    - Now you've got the OSX udisk
    


5. get Pop_OS onto a USB drive:   
     - i. Download `pop-os_amd64_nvidia_48.iso`((5,244,275,955 bytes))  from https://system76.com/pop (*1.76 GB (Intel/AMD) does't work*)
     - ii. Download Etcher from https://etcher.io/ then follow the install instruction http://pop.system76.com/docs/install-pop-os/ to make bootable drive  

     ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/etcherflashselected.png)  

6. Get Win10 onto a USB drive:  
    - i. In __Windows__ environment: just download the ultraISO burn images to USB drives,then you get the the win10 boot disk.
    - ii. Download DELL 1830 WiFi Driver in https://www.dell.com/support/home/au/en/aubsdt1/drivers/driversdetails?driverId=58FTM  copy to USB drive,otherwise you could not access to internet after installing the Win10.
    - iii. If you could only access to ubuntu follow the step iv.
    - iv. In __Ubuntu__  environment(It's quite useful,in case you have problem with installing windows)  
    - v.Install gparted  
    `sudo apt-get install gparted`  
    `sudo gparted`  
    - vi. Unmount the U drive  
    ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/umount.png)  
    - vii. Install woeusb make win10 boot  
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

8. If you want replace the wireless Card and don't want add the third antenna,connect the `black wire to gray` and connect `white wire to white `
    
# Install MacOS  
1. boot macOSUtility
    - i. Press F12 to boot from the Udisk then choose mac usb press`space`  
    - ii. Choose the second one `boot macOS with selected option`  and wait for about 2 minutes  
    - iii. Choose `Use English for the main language`  
2. disk partition and format
    - i. Choose `Disk Utility`  
    - ii. Select `Toshiba XG4 THNSN51T02DUK`
    - iii. `erase` with selected `format:Mac OS Extended (Journaled)` and `GUID Partition Map`  
    - iv. `Partition` with selected `Mac OS Extended(Journaled)`  

        |    Partition    | size |  
        | -------       | ------: |  
        | Mac           |  256 |  
        | PopOs           |  128 |  
        | WIN10           |  512 |  
        | Ubuntu          |  80  |  
        | Res             |46.88 |  
3. install MacOS
    - i. Close Disk Utility and choose `install macOS`  
    - ii. Click `continue` click `agree` select `Mac Partition` then click `install`  i
    - iii. Reboot and choose `boot from Mac`  in CLOVER  
    - iv.  It will take about 10 minutes to install Mac  
4. boot without Udisk  
    - i. Use `MacOS/EFI mount` 
    - ii. Mount EFI `USB` and `Toshiba XG4 THNSN51T02DUK`,if you could mount follow the step vi.
    - iii. Open the `terminal`  
    - iv. Input  `diskutil list`  and remember the EFI drive id (in my computer it's `disk0s1`)  
   ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/diskutil.png)  
    - v. Input the following command to show the EFI  
    `mkdir /Volumes/efi`  
    `sudo mount -t msdos /dev/disk0s1 /Volumes/efi`  
    - vi. Replace the `CLOVER` in `EFI` with the `CLOVER` in USB  
    - vii. Eject the Udisk now we could boot without the Udisk  

5. Install kext  
    - i. Open `MacOS/Kext Utility` and drag kexts in `Post-install/SLE-Kexts` to `Kext Utility`  
    - ii. Reboot  
    - iii. If you could open `EFI/clover/kexts/Other` follow step v  
    - iv. If you can't find EFI partition open `terminal` and input  
    `sudo mkdir /Volumes/efi`  
    `sudo mount -t msdos /dev/disk0s1 /Volumes/efi`  
    - v. Keep the `CoreDisplayFixup.kext`(if 4K Touch Screen)
    - vi. Delete other kexts  
    - vii. Copy kexts in `Post-install/CLOVER-Kexts` to this folder  

6. Make ComboJack work
    - i. Unpack `Post-install/ComboJack Installer.zip`  
    - ii. Use terminal `cd`  to  folder `ComboJack Installer`
    - iii. Run install.sh  
    `./install sh`  
7. Make Trackpad control panel work  
    - i. Install VoodooPS2Controller.kext follow RehabMan's instruction in https://github.com/RehabMan/OS-X-Voodoo-PS2-Controller/wiki/How-to-Install  
    - ii. Use `shift+command+G` and input `/System/Library/Extensions`(abbreviated to /S/L/E) open the folder
    - iii. Copy `MacOS/RehabMan-Voodoo-2017-1130/Release/VoodooPS2Controller.kext` to `/S/L/E`  
    - iv. Remove  `/S/L/E/AppleACPIPS2Nub.kext` and `remove /S/L/E/ApplePS2Controller.kext`  use the follow command  
    `sudo rm -rf /System/Library/Extensions/AppleACPIPS2Nub.kext`
    `sudo rm -rf /System/Library/Extensions/ApplePS2Controller.kext`
    - v. Copy `MacOS/RehabMan-Voodoo-2017-1130/org.rehabman.voodoo.driver.Daemon.plist`to `Library/LaunchDaemons`  
    - vi. Copy `MacOS/RehabMan-Voodoo-2017-1130/Release/VoodooPS2Daemon`to `/usr/bin`  
    - vii. Reboot then you could see the Trackpad control panel  
    ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/trackpadpanel.png)  



# Install Pop_OS!  

1. Boot Pop_OS! installation    
    - i. Press F12 to boot from UEFI: POP_OS Udisk  
    - ii. The you could see following pic,`enter`  
    ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/popos.png)  
2. Installing the Pop_OS  
    - i.Now you will be at the Pop!_OS desktop  click `install pop_os icon`  
    ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/poplivedesktop.jpg)  
    - ii.First we have to select the language we want to use:  
    ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/selectlanguagepop.jpg)  
    - iii. Select `Something else`  
    ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/somethingelse.PNG)  
    - iv. Select the `Pop_Os` partition which we assigned before  
    - v. Select Ext 4 as file type and / (means root) as the mount point.  
    ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/InstallingpopOS.png)  
    - vi. Confirm that you want to make changes to your hard disk (hard drive)  
    ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/writechanges.jpg)  
    - vii. Then Pop!_OS should start installing!  
    ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/installedpopos.jpg)  

3. Repair bluetooth drive  
    - i. Install `blueman`  
    `sudo apt install blueman`  
    - ii.The firmware blob that is needed by Broadcom devices is not supplied by default, and it has to be supplied manually.  
    - iii. Copy `Pop_OS/BCM-0a5c-6410.hcd` into /lib/firmware/brcm/ and then reboot your device.  
    `wget https://memcpy.io/files/2017-10-28/BCM-0a5c-6410.hcd`  
    `sudo cp BCM-0a5c-6410.hcd /lib/firmware/brcm/`  
    `sudo chmod 0644 /lib/firmware/brcm/BCM-0a5c-6410.hcd`  
    `sudo reboot`  
# Install WIN10   
1. Boot WIN10 installation    
    - i. Press F12 to boot from UEFI: win10 Udisk    
2. Installing the win10  
    - i. Press F12 to boot from UEFI: win10 Udisk
    - ii.Pselect the `win10` partition which we assigned before,then click `delete`,it should be the `unallocate` 
    - iii. Select this `unallocate memory` then click `continue`   install win10  
3. Delete bootManager  
    - i. Press F12 enter Bios setting  
    - ii. Delete `windows boot manager`  
4. Install Driver   
    - i.Install wire driver in `Win10/Driver/58FTM`,then you could access to the internet  
    - ii. Install `DELL Support`  install other drivers  
    






    

    






    





 

























References:  
[1] KNNSpeed [Guide] Dell XPS 15 9560: 4K Touch, 1TB SSD, 32GB RAM, 100% AdobeRGB  
https://www.tonymacx86.com/threads/guide-dell-xps-15-9560-4k-touch-1tb-ssd-32gb-ram-100-adobergb.224486/  
[2] gunslinger23/XPS15-9560-High-Sierra  https://github.com/gunslinger23/XPS15-9560-High-Sierra  
[3] Pop_OS install instruction   http://pop.system76.com/docs/install-pop-os/  
[4] Fixing bluetooth on the XPS 15 9550 on Ubuntu  https://memcpy.io/fixing-bluetooth-on-the-xps-15-9550-on-ubuntu.html