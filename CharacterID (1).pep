         BR      main, i
msg1:    .ASCII  "Vowel\x00"    
char1:   .BYTE   1
msg2:    .ASCII  "Capital\x00"
msg3:    .ASCII  "Even\x00"
msg4:    .ASCII  "Odd\x00"
msg5:    .ASCII  "Lower\x00"
msg6:    .ASCII  "Number\x00"
msg7:    .ASCII  "Other\x00"
msg8:    .ASCII  "------\x00"

main:    LDBA    0xFC15, d
         STBA    char1, d
         STRO    msg8, d
         LDBA    0xA, i
         STBA    0xFC16, d
         LDBA    char1, d
         STBA    0xFC16, d
         LDBA    0xA, i 
         STBA    0xFC16, d
         LDBA    char1, d
         CPBA    0x0071, i
         BREQ    done, i
         CPBA    0x0051, i
         BREQ    done, i 
         LDBA    char1, d 
         CPBA    0x002F, i
         BRLE    other, i
         CPBA    0x0039, i
         BRLE    number, i
         CPBA    0x0040, i
         BRLE    other, i
         CPBA    0x005A, i
         BRLE    capital, i 
         CPBA    0x0060, i
         BRLE    other, i
         CPBA    0x007A, i
         BRLE    lower, i
         CPBA    0x007F, i
         BRLE    other, i 
         
         

                              
other:   STRO    msg7,d
         LDBA    0xA, i 
         STBA    0xFC16, d
         BR      main, i

number:  STRO    msg6, d 
         CPBA    0x0030, i
         BREQ    even, i
         CPBA    0x0032, i
         BREQ    even, i
         CPBA    0x0034, i
         BREQ    even, i
         CPBA    0x0036, i
         BREQ    even, i
         CPBA    0x0038, i
         BREQ    even, i
         CPBA    0x0031, i
         BREQ    odd, i
         CPBA    0x0033, i
         BREQ    odd, i
         CPBA    0x0035, i
         BREQ    odd, i
         CPBA    0x0037, i
         BREQ    odd, i
         CPBA    0x0039, i
         BREQ    odd, i
         LDBA    0xA, i
         STBA    0xFC16, d
         BR      main, i 
        

capital: STRO    msg2, d 
         CPBA    0x0041, i
         BREQ    vowel, i
         CPBA    0x0045, i
         BREQ    vowel, i
         CPBA    0x0049, i
         BREQ    vowel, i
         CPBA    0x004F, i
         BREQ    vowel, i
         CPBA    0x0055, i
         BREQ    vowel, i
         LDBA    0xA, i
         STBA    0xFC16, d
         BR      main, i
         

lower:   STRO    msg5, d
         CPBA    0x0061, i
         BREQ    vowel, i
         CPBA    0x0065, i
         BREQ    vowel, i
         CPBA    0x0069, i
         BREQ    vowel, i
         CPBA    0x006F, i
         BREQ    vowel, i
         CPBA    0x0075, i
         BREQ    vowel, i
         LDBA    0xA, i
         STBA    0xFC16, d
         BR      main, i
         
         
vowel:   LDBA    0xA, i
         STBA    0xFC16, d
         STRO    msg1, d
         LDBA    0xA, i
         STBA    0xFC16, d
         BR      main, i

even:    LDBA    0xA, i
         STBA    0xFC16, d
         STRO    msg3, d
         LDBA    0xA, i
         STBA    0xFC16, d
         BR      main, i

odd:     LDBA    0xA, i
         STBA    0xFC16, d
         STRO    msg4, d
         LDBA    0xA, i
         STBA    0xFC16, d
         BR      main, i

done:    STOP
         .end
         
         