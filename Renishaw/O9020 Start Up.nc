%
O9020(REN M-CODE ON)

(LOCK THE SPINDLE)
N10 M19

(TODO - FIND WAY TO CHECK M FUNCTION STATUS)
N20 M64 (SELECT SPINDLE PROBE)

N30 M67
N40 G04P200
N50 M66 (TURN ON SPINDLE PROBE)
N60 G04P200
N70 M67
N75 G04P500

N80 #:S1 (CHECK FOR PROBE ERRORS)
N85 #WAIT
N90 #IF I(3)=1 THEN GOTO:S2 'ERROR
N100 #IF I(4)=1 THEN GOTO:S2 'BATTERY
N110 #GOTO:S3

N120 #:S2
N130 M98 P9740
N140 #GOTO:S1000

N150 #:S3
N170 #WAIT
N180 M99

N190 #:S1000
N200 M0(DO NOT PRESS CYCLE START,PRESS MANUAL)
N210 M2
%