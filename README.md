# Info

This script automatically pulls the services.jar from your android device, Patches it with Haystack for android 11, and then compiles it back into a flashable magisk module.

# Requirements

This script is intended to be run on a linux system (WSL should work)

```ADB``` and ```java``` are required.

# Warning!

If ADB is not enabled, or fails to find the services.jar file, this script may produce a bootloop causing magisk module, (if you dont know how to resolve this from the recovery, use the manual installation)

Run ```adb devices``` to make sure your phone is connected, and that it is the *only* connected device.

# Screenshots

![alt text](https://media.discordapp.net/attachments/686516718008401949/904587968969326662/2021-11-01T1529564117417421100.png)

# Manual Installation

### 0) - Setup

For this script to work you must be in rooted adb mode, run ```adb root``` to restart adb in root mode

### 1) - Working directory

Create a folder to house all the files required.

### 2) - Download files

```https://gitlab.com/oF2pks/haystack/-/raw/11-attempt/spoof_AVDapi30.zip.ONLY'MAGISK&ANDROID-STUDIO```

```https://gitlab.com/oF2pks/haystack/-/archive/11-attempt/haystack-11-attempt.zip```

```https://github.com/DexPatcher/dexpatcher-tool/releases/download/v1.8.0-beta1/dexpatcher-1.8.0-beta1.jar```

### 3) - Rename

Rename ```spoof_AVDapi30.zip.ONLY'MAGISK&ANDROID-STUDIO``` to ```spoof_AVDapi30.zip```.

### 4) - Extract 

Unzip ```haystack-11-attempt.zip```.

### 5) - Move files

Move ```dexpatcher-1.8.0-beta1.jar``` inside the new ```haystack-11-attempt``` folder.

### 6) - ADB

Run the following command using rooted ADB to fetch the file we are going to modify.

```adb pull /system/framework/services.jar```

Then copy it into the ```haystack-11-attempt``` folder.

### 7) - Patching 

With java installed in a linux environment, run the following command inside the ```haystack-11-attempt``` folder.

```java -jar dexpatcher-1.8.0-beta1.jar -a 11 -M -v -d -o ./ services.jar 11-hook-services.jar.dex 11core-services.jar.dex```

This should create several new classes.dex files.

### 8) - Re-packing

Create a ```repack``` folder inside the ```haystack-11-attempt``` folder.

Then run ```zip -j repack/services.jar classes*.dex``` to create a new services.jar

### 9) - Swap in new file

Go back to the first folder and unzip the ```spoof_AVDapi30.zip``` file (take note of which files belong to it)

Delete the old services.jar located at ```system/framework/services.jar``` and replace it with the file from the ```repack``` folder.

### 10) - Re-packing the magisk module

Put all the unzipped files back into a zip file named ```spoof_AVDapi30.zip``` And install this as a magisk module.

If your phone is still plugged in you can run ```adb push spoof_AVDapi30.zip /storage/emulated/0/Download/``` to send the file to your phones downloads folder.

# Credits

The method and downloads are from https://forum.xda-developers.com/t/signature-spoofing-on-unsuported-android-11-r-roms.4214143/

The script and this documentation was created by myself.
