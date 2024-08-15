         BR      main,  i
dash:    .ASCII  "\n--------------------\n\x00"
msg1:    .ASCII  "error\x00"

main:    LDBA    0xFC15, d
         ADDSP   -1, i 
         STBA    0, s

         DECI    -2, s
         BRV     error1, i 
         ADDSP   -2, i
         
         DECI    -2, s
         BRV     error1, i 
         ADDSP   -2, i

         CALL    sign, i
         ADDSP   5, i
         BR      main, i

         
         
         


sign:    LDBA    6, s
         CPBA    '+', i
         BREQ     add, i
         CPBA     '-', i
         BREQ    subt, i
         CPBA    '*', i 
         BREQ    mult, i
         CPBA    '/',i 
         BREQ    divide
         CPBA    'q', i 
         BREQ    done, i
         CPBA    'Q', i
         BREQ    done, i
         



add:     LDWA    2, s
         ADDA    4, s
         ADDSP   -2, i
         BRV     error1, i
         STWA    0, s 
         BR      print, i
         
subt:    LDWA    4, s
         SUBA    2, s
         ADDSP   -2, i
         BRV     error1, i
         STWA    0, s 
         BR      print, i

divide:  LDWX    0, i
         ADDSP   -2, i
         LDWA    6, s
         STWA    0, s
         LDWA    4, s
         CPWA    0, i
         BRLT    divS, i
         LDWA    6, s
         CPWA    0, i
         BRLT    divN, i
         BR      loopD, i

divS:    LDWA    0, s
         CPWA    0, i
         BRLT    same, i
         ADDA    4, s
         CPWA    0, i
         BRLT    storeD
         STWA    0, s
         SUBX    1, i
         BR      divS, i

divN:    LDWA    0, s
         ADDA    4, s
         CPWA    0, i
         BRGT    storeD, i
         STWA    0, s
         SUBX    1, i
         BR      divN, i

same:    LDWA    0, s
         SUBA    4, s
         BRV     error1, i
         CPWA    0, i 
         BRGT    storeD, i
         STWA    0, s
         ADDX    1, i
         BR      same, i

loopD:   LDWA    0, s
         SUBA    4, s
         CPBA    0, i
         BRLT    storeD, i
         STWA    0, s
         ADDX    1, i
         BR      loopD, i

storeD:  STWX    0, s
         BR      print, i


mult:    LDWX    0, i
         ADDSP   -2, i
         LDWA    0, i
         STWA    0, s
         LDWA    6, s
         CPWA    0, i
         BRLT    negM1
         LDWA    4, s
         CPWA    0, i
         BRLT    negM1
         LDWA    6, s
         CPWA    4, s
         BRLT    loopM2, i
         BR      loopM, i


negM1:   LDWA    6, s
         CPWA    4, s
         BRLT    loopN, i
         BR      loopN2, i

loopN:   LDWA    0, s
         SUBA    4, s
         BRV     error1, i
         STWA    0, s 
         SUBX    1, i
         CPWX    6, s
         BREQ    print, i
         BR      loopN, i

loopN2:  LDWA    0, s
         SUBA    6, s        
         BRV     error1, i
         STWA    0, s 
         SUBX    1, i
         CPWX    4, s
         BREQ    print, i
         BR      loopN2, i

loopM:   LDWA    0, s        
         ADDA    6, s
         BRV     error1, i
         STWA    0, s 
         ADDX    1, i
         CPWX    4, s
         BREQ    print, i
         BR      loopM, i

loopM2:  LDWA    0, s
         ADDA    4, s
         BRV     error1, i
         STWA    0, s 
         ADDX    1, i
         CPWX    6, s
         BREQ    print, i
         BR      loopM2, i
 

print:   LDBA    8,s
         STBA    0xFC16,d
         LDBA    0x0020, i
         STBA    0xFC16, d
         DECO    6,s
         LDBA    0x0020, i
         STBA    0xFC16, d
         DECO    4,s
         STBA    0xFC16, d
         LDBA    '=', i
         STBA    0xFC16, d
         LDBA    0x0020, i
         STBA    0xFC16, d
         DECO    0,s
         ADDSP   2,i
         STRO    dash, d
         RET 
        

error1:  LDBA    8, s
         STBA    0xFC16, d
         LDBA    0x0020, i
         STBA    0xFC16, d
         DECO    6, s
         LDBA    0x0020, i
         STBA    0xFC16, d
         DECO    4, s
         STBA    0xFC16, d
         LDBA    '=', i
         STBA    0xFC16, d
         LDBA    0x0020, i
         STBA    0xFC16, d
         STRO    msg1, d
         STRO    dash, d
         ADDSP   2, i
         RET
         

done:    STOP
         .end