         BR      firstn, i 
msg1:    .ASCII  "Invalid input, please try again{P,J,G,L}\n\x00"
msg2:    .ASCII  "Invalid input, please try again{G, B, S, T}\n\x00"
msg3:    .ASCII  "Number must be positive\n\x00"
msgad:   .ASCII  "Invalid character, try again {A,D}\n\x00"
msg4:    .ASCII  " Peter\x00 "
msg5:    .ASCII  " Joe\x00 "
msg6:    .ASCII  " Glen\x00 "
msg7:    .ASCII  " Lois\x00 "
msg8:    .ASCII  " Griffen\n\x00 "
msg9:    .ASCII  " Brown\n\x00"
msg10:   .ASCII  " Swanson\n\x00"
msg11:   .ASCII  "Tucker\n\x00"
num:     .BLOCK  2
ads:   .BLOCK  1 
num2:    .BLOCK  2
char1:   .BYTE   1  
char2:   .BYTE   1

firstn:  LDBA    0xFC15, d
         STBA    char1, d
         CPBA    0xA,i
         BREQ    firstn,i
         CPBA    'P', i
         BREQ    lastn
         CPBA    'J', i
         BREQ    lastn
         CPBA    'G', i
         BREQ    lastn
         CPBA    'L', i
         BREQ    lastn  
         STRO    msg1, d
         BR      firstn
         

lastn:   LDBA    0xFC15, d
         STBA    char2, d
         CPBA    0xA,i
         BREQ    lastn,i
         CPBA    'G', i
         BREQ    nums
         CPBA    'B', i
         BREQ    nums
         CPBA    'S', i
         BREQ    nums
         CPBA    'T', i
         BREQ    nums
         STRO    msg2, d
         BR      lastn

nums:    DECI    num, d
         LDWA    num,d
         CPWA    1, i
         BRGT    ad,i
         STRO    msg3, d
         BR      nums


ad:      LDBA    0xFC15, d
         STBA    ads, d
         CPBA    0xA,i
         BREQ    ad,i
         CPBA    'A', i
         BREQ    namesA
         CPBA    'D', i
         BREQ    namesD
         STRO    msgad, d
         BR      ad, i


namesA:  LDWA    0, i 
         STWA    num2, d
loopA:   LDWA    num2, d
         ADDA    1, i
         STWA    num2, d
         CPWA    num, d
         BRGT    done, i
         DECO    num2, d
         LDBA    char1, d
         CPBA    'P', i
         BREQ    firstP, i 
         CPBA    'J', i
         BREQ    firstJ, i 
         CPBA    'G', i
         BREQ    firstfG, i 
         CPBA    'L', i
         BREQ    firstL, i 
         

namesD:  LDWA    num, d
         ADDA    1,i
         STWA    num2, d
loopD:   LDWA    num2, d 
         SUBA    1, i
         STWA    num2, d
         CPWA    0, i
         BREQ    done, i
         DECO    num2, d
         LDBA    char1, d
         CPBA    'P', i
         BREQ    firstP, i
         CPBA    'J', i
         BREQ    firstJ, i
         CPBA    'G', i
         BREQ    firstfG, i 
         CPBA    'L', i
         BREQ    firstL, i 

firstP:  STRO    msg4, d
         LDBA    char2, d
         CPBA    'G', i
         BREQ    lastG, i
         CPBA    'B', i
         BREQ    lastB, i
         CPBA    'S', i
         BREQ    lastS, i
         CPBA    'T', i
         BREQ    lastT, i
         

firstJ:  STRO    msg5, d
         LDBA    char2, d
         CPBA    'G', i
         BREQ    lastG, i
         CPBA    'B', i
         BREQ    lastB, i
         CPBA    'S', i
         BREQ    lastS, i
         CPBA    'T', i
         BREQ    lastT, i
         

firstfG: STRO    msg6, d
         LDBA    char2, d
         CPBA    'G', i
         BREQ    lastG, i
         CPBA    'B', i
         BREQ    lastB, i
         CPBA    'S', i
         BREQ    lastS, i
         CPBA    'T', i
         BREQ    lastT, i
         

firstL:  STRO    msg7, d
         LDBA    char2, d
         CPBA    'G', i
         BREQ    lastG, i
         CPBA    'B', i
         BREQ    lastB, i
         CPBA    'S', i
         BREQ    lastS, i
         CPBA    'T', i
         BREQ    lastT, i

lastG:   STRO    msg8, d
         LDBA    0xA, i
         STBA    0xFC16,d
         LDBA    char1, i
         CPBA    'A', i
         BREQ    loopA, i
         BR      loopD, i
         

lastB:   STRO    msg9, d
         LDBA    0xA, i
         STBA    0xFC16, d
         LDBA    char1, i
         CPBA    'A', i
         BREQ    loopA, i
         BR      loopD, i


lastS:   STRO    msg10, d
         LDBA    0xA, i
         STBA    0xFC16, d
         LDBA    char1, i
         CPBA    'A', i
         BREQ    loopA, i
         BR      loopD, i


lastT:   STRO    msg11, d
         LDBA    0xA, i
         STBA    0xFC16,d 
         LDBA    char1, i
         CPBA    'A', i
         BREQ   loopA, i
         BR     loopD, i


done:    STOP
         .end