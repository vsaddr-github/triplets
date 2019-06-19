BEGIN {f1="0"; f2="0"; f3="0"; i="" ; fld="C:\\Users\\vsereb\\Pictures\\Watk20190610\\"; cnt=0}
                            {print "rem ## " $0}
/,0$/                       {
                              split($0, a,"," )
                              f1=a[1]
                              split(a[3], b, ".")
                              FL=b[1]
                              if (a[7] == "AEB" ) # we are in start of seq 0f 3!
                               {
                                f2=""; f3=""; sub(" ","T",a[2]); gsub(":","",a[2]); i="IMG_" a[2] ;
                               }
                              else
                               {
                                cnt=cnt+1 
                                print "rem #single num:" , cnt,FL, f1; 
                                print "IF NOT EXIST " "\"" fld FL ".jpg\"" , "\"C:\\Program Files\\SNS-HDR Lite 2\\SNS-HDR.exe \"   -srgb  -x1 -n1 -default -o \"" fld FL ".jpg\""  ,"\"" f1 "\"  -ee \"C:\\Program Files (x86)\\IrfanView\\i_view32.exe\" < c:\\temp\\cr.txt";
                                #print "IF     EXIST " "\"" fld FL ".jpg\"" , "\"C:\\Program Files\\SNS-HDR Lite 2\\ExifTool.exe\"   -overwrite_original_in_place -copyright=\"" f1 "\"", "\"" fld FL ".jpg\""  
                                f1=""; FL=""
                               }
                            } # 2007:08:04 19:19:45
 /,-[1-9]\/[1-9]$/  ||  /,-[1-9]$/    { split($0, a,"," )  ;  f2=a[1]  ; print "rem ##  -- second "  f2 ; }
/,\+[1-9]\/[1-9]$/  || /,\+[1-9]$/    { split($0, a,"," )  ;  f3=a[1]  ; print "rem ##  ++ third  "  f3 ;
        if (length(i) > 4) 
            {
            cnt=cnt+1
            print "rem num:" , cnt
            print "IF NOT EXIST " "\"" fld i "d.jpg\"" , "\"C:\\Program Files\\SNS-HDR Lite 2\\SNS-HDR.exe \"  -srgb  -x1 -n1 -default   -o \"" fld i "d.jpg\""  ,"\"" f1 "\"", "\"" f2 "\"", "\"" f3 "\"   -ee \"C:\\Program Files (x86)\\IrfanView\\i_view32.exe\"  < c:\\temp\\cr.txt ";
            print "IF     EXIST " "\"" fld i "d.jpg\"" , "\"C:\\Program Files\\SNS-HDR Lite 2\\ExifTool.exe\"  -overwrite_original_in_place -copyright=\"" f1, f2, f3 "\"", "\"" fld i "d.jpg\""  
            print "IF NOT EXIST " "\"" fld i "l.jpg\"" , "\"C:\\Program Files\\SNS-HDR Lite 2\\SNS-HDR.exe \"  -srgb  -x1 -n1 -landscape -o \"" fld i "l.jpg\""  ,"\"" f1 "\"", "\"" f2 "\"", "\"" f3 "\"  -ee \"C:\\Program Files (x86)\\IrfanView\\i_view32.exe\"  < c:\\temp\\cr.txt ";
            print "IF     EXIST " "\"" fld i "l.jpg\"" , "\"C:\\Program Files\\SNS-HDR Lite 2\\ExifTool.exe\"  -overwrite_original_in_place -copyright=\"" f1, f2, f3 "\"", "\"" fld i "l.jpg\""  
            i=""; f1=""; f2=""; f3=""; FL=""
            }
      }
END { 
      if (length(f1) > 0 )
      {
        cnt=cnt+1
        print "rem #single skip num:" cnt, f1;
        print "IF NOT EXIST " "\"" fld FL ".jpg\"" , "\"C:\\Program Files\\SNS-HDR Lite 2\\SNS-HDR.exe \"   -srgb  -x1 -n1 -default -o \"" fld FL ".jpg\""  ,"\"" f1 "\"  -ee \"C:\\Program Files (x86)\\IrfanView\\i_view32.exe\"  < c:\\temp\\cr.txt ";
        #print "IF     EXIST " "\"" fld FL ".jpg\"" , "\"C:\\Program Files\\SNS-HDR Lite 2\\ExifTool.exe\"   -overwrite_original_in_place -copyright=\"" f1 "\"", "\"" fld FL ".jpg\"" 
        f1=""
       }
    }
