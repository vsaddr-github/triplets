BEGIN {f1=""; f2=""; f3=""; 
       ff1=""; ff2=""; ff3=""
       i="" ; cnt=0;
       TGT_DIR="C:\\Pictures\\Watk20190610\\"; 
       SNS_HDR_EXE="C:\\Program Files\\SNS-HDR Lite 2\\SNS-HDR.exe";
       EXIFTOOL="C:\\Program Files\\SNS-HDR Lite 2\\ExifTool.exe";
       I_VIEW="C:\\Program Files (x86)\\IrfanView\\i_view32.exe"
       XF_1="-x1 ";
       NS_1="-n1 ";
       XF_3="-x1 ";
       NS_3="-n1 ";
       CRF=" c:\\temp\\cr.txt"
       JPG=".jpg"
       DJPG="d.jpg"
       LJPG="l.jpg"
       
       }
                {print "rem #Line " $0}
/,0$/           {
                    split($0, a,"," )
                    f1=a[1]
                    ff1=a[3]
                    split(a[3], b, ".")
                    FILE_NAME=b[1]
                    if (a[7] == "AEB" ) # we are in start of seq 0f 3!
                    {
                        print "rem ##  ~~ first file", f1
                        f2=""; f3=""; sub(" ","T",a[2]); gsub(":","",a[2]); i="IMG_" a[2] ;
                    }
                    else
                    {
                        cnt=cnt+1 ;
                        print "rem #Num", cnt, "#single shot:" , f1; 
                        print "IF NOT EXIST  \"" TGT_DIR FILE_NAME JPG "\"" , "\"" SNS_HDR_EXE  "\"", "-srgb" , XF_1, NS_1, "-default -o \"" TGT_DIR FILE_NAME JPG "\"" , "\"" f1 "\"", " -ee \"" I_VIEW "\"" , " < ", CRF ;
                        print "IF     EXIST  \"" TGT_DIR FILE_NAME JPG "\"" , "\"" EXIFTOOL     "\"", "-overwrite_original_in_place -UserComment=\"" ff1 "\"", "\"" TGT_DIR FILE_NAME JPG "\""  ;
                        f1=""; FILE_NAME=""
                    }
                } # 
 /,-[1-9]\/[1-9]$/  ||  /,-[1-9]$/    { split($0, a,"," )  ;  f2=a[1] ; ff2=a[3] ; print "rem ##  -- second file "  f2 ; }
/,\+[1-9]\/[1-9]$/  || /,\+[1-9]$/    { split($0, a,"," )  ;  f3=a[1] ; ff3=a[3] ; print "rem ##  ++ third  file "  f3 ;
        if (length(i) > 4) 
            {
                cnt=cnt+1
                print "rem num:" , cnt
                print "IF NOT EXIST " "\"" TGT_DIR i "d.jpg\"" , "\"" SNS_HDR_EXE  "\"", "-srgb", XF_3, NS_3, "-default   -o \"" TGT_DIR i "d.jpg\""  ,"\"" f1 "\"", "\"" f2 "\"", "\"" f3 "\" -ee \"C:\\Program Files (x86)\\IrfanView\\i_view32.exe\" < c:\\temp\\cr.txt";
                print "IF     EXIST " "\"" TGT_DIR i "d.jpg\"" , "\"" EXIFTOOL     "\"", "-overwrite_original_in_place -UserComment=\"" ff1, ff2, ff3 "\"", "\"" TGT_DIR i DJPG "\""
                
                print "IF NOT EXIST " "\"" TGT_DIR i "l.jpg\"" , "\"" SNS_HDR_EXE  "\"", "-srgb", XF_3, NS_3, "-landscape -o \"" TGT_DIR i "l.jpg\""  ,"\"" f1 "\"", "\"" f2 "\"", "\"" f3 "\" -ee \"C:\\Program Files (x86)\\IrfanView\\i_view32.exe\" < c:\\temp\\cr.txt";
                print "IF     EXIST " "\"" TGT_DIR i "l.jpg\"" , "\"" EXIFTOOL     "\"", "-overwrite_original_in_place -UserComment=\"" ff1, ff2, ff3 "\"", "\"" TGT_DIR i LJPG "\""  
                i=""; f1=""; f2=""; f3=""; FILE_NAME=""
            }
      }
END { 
      if (length(f1) > 0 )
      {
        cnt=cnt+1
        print "rem #Num ", cnt, "last single shot:", f1;
        print "IF NOT EXIST " "\"" TGT_DIR FILE_NAME JPG "\"" , "\"" SNS_HDR_EXE  "\"",  "-srgb", XF_1, NS_1, "-default -o \"" TGT_DIR FILE_NAME JPG "\""  ,"\"" f1 "\"  -ee \"C:\\Program Files (x86)\\IrfanView\\i_view32.exe\"  < c:\\temp\\cr.txt ";
        print "IF     EXIST " "\"" TGT_DIR FILE_NAME JPG "\"" , "\"" EXIFTOOL    "\"" ,  "-overwrite_original_in_place -UserComment=\"" ff1 "\"", "\"" TGT_DIR FILE_NAME JPG "\"" 
        f1=""
       }
    }
