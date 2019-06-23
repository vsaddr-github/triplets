# triplets
Scripts to group auto bracketed Canon CR2 files
This repository contains notes and scripts to group CR2 Canon files for SNS processing

Required SNS-HDR (includeing Exiftool) and Git Bash
Sample below is for Canon 6D Mark II camera. Different makes may require different flags in OPTS. 
See Exiftool manual for tag descriptions 

Here is approximate workflow

Suppose SD card with the images is mounted as E: drive. The card's switch is in R/O mode for the safety of the pictures

The destination folder where images will be placed is defined in awk script.

File c:\temp\cr.txt should is required and must have one single empty line - all we need is carriage return in this file.

# In DOS window run:

set OPTS=-fileOrder DateTimeOriginal -DateTimeOriginal -Filename -ExposureTime -FNumber  -AEBBracketValue

cd /d E:\DCIM\100CANON

"C:\Program Files\SNS-HDR Lite 2\exiftool" -T  %OPTS%   -csv -ext  CR2 IMG_*.CR2  > c:\temp\list48.txt

# In Git Bash window run:

awk -f /c/temp/triple.awk /c/temp/list48.txt > /c/temp/triple.bat

# In DOS window run:

cd /d E:\DCIM\100CANON

C:\temp\triple.bat

# That command above may take many hours to execute.


