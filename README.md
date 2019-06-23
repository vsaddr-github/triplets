# Scripts to group auto bracketed Canon CR2 files for SNS-HDR processing

This repository contains notes and scripts to help group RWAW CR2 Canon files for SNS-HDR command-line processing.

Required:
- SNS-HDR (including Exiftool) - download SNS-HDR Lite from https://www.sns-hdr.com/
- Git Bash or equivalent Linux emulator . Download from https://gitforwindows.org/
- Ifran View - download from https://www.irfanview.com/
- File c:\temp\cr.txt is required and must have one single empty line.

### Sample code below is for Canon 6D Mark II camera. 

Different camera makes may require different flags in OPTS below.

See Exiftool manual for the tag descriptions 

Here is the approximate workflow:

Suppose SD card with the images is mounted as E: drive. The card's switch is in R/O mode for the safety of the pictures

The destination folder where the final images will be placed is defined in awk script as follows:

`TGT_DIR="C:\\Pictures\\Watk20190610\\"` 

SNS-HDR executable is: 

`SNS_HDR_EXE="C:\\Program Files\\SNS-HDR Lite 2\\SNS-HDR.exe"`

Exiftool executable is: 

`EXIFTOOL="C:\\Program Files\\SNS-HDR Lite 2\\ExifTool.exe"`

Ifran view executable:

`I_VIEW="C:\\Program Files (x86)\\IrfanView\\i_view32.exe"`

File c:\temp\cr.txt is required and must have one single empty line - all we need is carriage return in this file.

Other options:
- XF_1="-x1 " scaling for single files
- NS_1="-n1 " noise reduction for single files
- XF_3="-x1 " scaling for triplets
- NS_3="-n1 " noise reduction for triplets

## In DOS window run:

`set OPTS=-fileOrder DateTimeOriginal -DateTimeOriginal -Filename -ExposureTime -FNumber  -AEBBracketValue`

`cd /d E:\DCIM\100CANON`

`"C:\Program Files\SNS-HDR Lite 2\exiftool" -T  %OPTS%   -csv -ext  CR2 IMG_*.CR2  > c:\temp\list48.txt`

## In Git Bash window run:

`awk -f /c/temp/triple.awk /c/temp/list48.txt > /c/temp/triple.bat`

## In DOS window run:

`cd /d E:\DCIM\100CANON`

`C:\temp\triple.bat`

> That command above may take many hours to execute.


