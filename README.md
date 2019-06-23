# triplets
Scripts to group auto bracketed Canon CR2 files
This repository contains notes and scripts to group CR2 Canon files for SNS processing

Required SNS-HDR (includeing Exiftool) and Git Bash
Sample below is for Canon 6D Mark II camera. Different makes may require different flags in OPTS. 
See Exiftool manual for tag descriptions 

Here is approximate workflow

Supoose SD card with images (card is locked as R/O) is mounted as E: drive

# In DOS window run:

set OPTS=-fileOrder DateTimeOriginal -DateTimeOriginal -Filename -ExposureTime -FNumber  -AEBBracketValue

cd /d E:\DCIM\100CANON

"C:\Program Files\SNS-HDR Lite 2\exiftool" -T  %OPTS%   -csv -ext  CR2 IMG_*.CR2  > c:\temp\list48.txt

# In Git Bash window run:

awk -f /c/temp/triple.awk /c/temp/list48.txt > /c/temp/triple.bat

# In DOS window run:

cd /d E:\DCIM\100CANON

C:\temp\triple.bat

