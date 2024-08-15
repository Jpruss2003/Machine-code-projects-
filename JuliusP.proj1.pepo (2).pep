        
         
         LDWA    0xFFFF, i
         STWA    0x0080, d 
         DECO    0x0080 ,d 
         LDBA    0xA, i
         STBA    0xFC16, d
         
         
         LDBA    0xFC15, d
         STBA    0x0061, d
         LDBA    0x0061, d
         STBA    0xFC16, d
         LDBA    0xA, i
         STBA    0xFC16, d
         LDBA    0x0061, d
         SUBA    0x0020, i
         STBA    0x0051, d
         LDBA    0x0051, d 
         STBA    0xFC16, d
         
         LDBA    0xA, i
         STBA    0xFC16, d
         DECO    0x0060, d
         
         LDBA 0xA, i
         STBA 0xFC16, d
         DECO 0x0050, d

         LDBA 0xA, i
         STBA 0xFC16, d
         LDBA 0x0061, d 
         HEXO 0x0060, d
         STOP
         .end
         
       
         
         
         
      