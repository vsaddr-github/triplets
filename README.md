# triplets
Scripts to group auto bracketed Canon CR2 files
This repository contains notes and scripts to group CR2 Canon files for SNS processing

Required SNS-HDR (includeing Exiftool) and Git Bash
Sample below is for Canon 6D Mark II camera. Different makes may require different flags in OPTS. 
See Exiftool manual for tag descriptions 

Here is approximate workflow

Supoose SD card with images (card is locked as R/O) is mounted as E: drive

In DOS window run:

set OPTS=-fileOrder DateTimeOriginal -DateTimeOriginal -Filename -ExposureTime -FNumber  -AEBBracketValue
cd /d E:\DCIM\100CANON
"C:\Program Files\SNS-HDR Lite 2\exiftool" -T  %OPTS%   -csv -ext  CR2 IMG_*.CR2  > c:\temp\list48.txt

In Git Bash window run:

awk -f /c/temp/triple.awk /c/temp/list48.txt > /c/temp/triple.bat
# E:\DCIM\100CANON>C:\temp\triple.bat
#vsereb@sokol7 MINGW32 /e/DCIM/100CANON
#  awk -f /c/temp/triple2.awk /c/temp/list48.txt > /c/temp/triple2.bat
#  awk -f /c/temp/triple2.awk /c/temp/list48_1.txt > /c/temp/triple2_1.bat
#  awk -f /c/temp/triple3.awk /c/temp/list48_1.txt > /c/temp/triple2_3.bat
# F:\DCIM\100CANON> c:\temp\triple2_3.bat

# set OPTS=-fileOrder DateTimeOriginal -DateTimeOriginal -Filename -ExposureTime -FNumber -ExposureMode -BracketMode -BracketValue -BracketShotNumber -AEBBracketValue
# C:\Users\vsereb\Pictures\Watk20190610>"C:\Program Files\SNS-HDR Lite 2\exiftool" -T  %OPTS%   -csv -ext  CR2  f:\DCIM\100CANON\ > c:\temp\list48_4.txt
