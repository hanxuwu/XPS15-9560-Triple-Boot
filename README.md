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
    Everything else!  

# Prepare the Installation (in Windows)  

1. Update SSD firmware to the latest(use DELL support)  
2. Update BIOS to v1.7.0  
3. Set the SATA Operation from Raid0 to AHCI  
    - i. win+R
    - ii. input `msconfig`
    - iii. tick `safeboot` click `OK`



















KNNSpeed [Guide] Dell XPS 15 9560: 4K Touch, 1TB SSD, 32GB RAM, 100% AdobeRGB