# Developing software and Environment Configuration  

# Win10:  
1. Dell Premier Color Software Application  
2. nVIDIA GeForce /GTX /Quadro graphic Driver  
3. Microsoft Office  
4. Chrome  
5. Vscode
6. git  
    
7. Wechat
8. Netease Cloud Music  
9. Anaconda(Jupyter)  
    -i. If CMD could not use `python` add following to UserVariable Path
    `C:\Users\Username\Anaconda3`  
    `C:\Users\Username\Anaconda3\Scripts`  
    `C:\Users\Username\Anaconda3\Library\bin`  
    ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/PythonPath.PNG)   

    -ii. Setting Jupyter startpath  
        &ensp;&ensp;a.Delete `%USERPROFILE%` in Target  
        &ensp;&ensp;b.Replace the `%USERPROFILE%` with the dir path   
>       C:\Users\HANXU\Anaconda3\python.exe C:\Users\HANXU\Anaconda3\cwp.py  
>       C:\Users\HANXU\Anaconda3 C:\Users\HANXU\Anaconda3\python.exe  
>       C:\Users\HANXU\Anaconda3\Scripts\jupyter-notebook-script.py  
>       "C:\Study\Python\Jupyter Notebook"  
> ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/JupyterPath.PNG)   



10. Evernote  
11. WSL  
        i. Install windows Subsystem for Linux(WSL)  
        a.Turn on  windows feature  
        ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/WSL1.PNG)  
        b. Download Ubuntu from Microsoft Store,run `bash` in cmd   
        c. Create User  
        ![image](https://github.com/hanxuwu/XPS15-9560-Triple-Boot/blob/master/DOCUMENTS/SCREENSHOTS/WSL3.png)  

# Pop!_OS  

1. Install oh my zsh
a. Check if installed zsh  
`zsh --version`  
b. Install zsh  
`sudo apt-get install zsh`  
c. Install wget  
`sudo apt-get install zsh`  
d. Check current bash  
`echo $SHELL/bin/bash`  
e. Install oh-my-bash  
`$ wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh`  
f. Change bash to zsh：  
`$ chsh -s /bin/zsh`  
g. Reboot：  
`$ sudo reboot`  
h. Use the random theme  
`gedit ~/.zshrc`  
`ZSH_THEME="random"`  
`ZSH_THEME_RANDOM_CANDIDATES = ( "fino" "ys")`  
![image](https://github.com/hanxuwu/Learning-Linux/blob/master/Pop!_OS/SCREENSHOT/ZSH.PNG)  

2. Install Incremental completion on zsh  
a. Create folder in plugins  
`cd .oh-my-zsh/plugins`  
`sudo mkdir incr`  
b. Create newfile  
`cd incr`  
`sudo gedit incr-0.2.zsh`  
c. Copy the content incr-0.2.zsh download from mimosa-pudica.net/zsh-incremental.html  
d. Add the configutation  
`gedit ~/.zshrc`  
`source ~/.oh-my-zsh/plugins/incr/incr*.zsh`  

![image](https://github.com/hanxuwu/Learning-Linux/blob/master/Pop!_OS/SCREENSHOT/ZSH1.PNG)  

3. Install Guake  
a.Install Guake  
`sudo apt-get install guake`  
b.Add it to start application  
![image](https://github.com/hanxuwu/Learning-Linux/blob/master/Pop!_OS/SCREENSHOT/GUAKE.PNG)  
c. Press F12  
![image](https://github.com/hanxuwu/Learning-Linux/blob/master/Pop!_OS/SCREENSHOT/GUAKE2.PNG)  

4. Install nvbn/theFUCK corrects your previous console command  
a. intall the FUCK  
`sudo apt update`  
`sudo apt install python3-dev python3-pip`  
`sudo pip3 install thefuck`  
 ![image](https://github.com/hanxuwu/Learning-Linux/blob/master/Pop!_OS/SCREENSHOT/FUCK.PNG)   
b.You should place this command in your .bash_profile, .bashrc, .zshrc or other startup script:  
> `eval $(thefuck --alias)`  
> `# You can use whatever you want as an alias, like for Mondays:`  
> `eval $(thefuck --alias FUCK)`  

5.Install pip
`$ sudo apt-get install python-pip python-dev build-essential`
`$ sudo pip install --upgrade pip` 



        


    





