%
O9740(REN PROBE ERROR)
N10 #WAIT
N20 #PRINT""
N30 #PRINT""
N40 #PRINT"**********************************************************"
N50 #PRINT"                  PROBE ERROR ALARM !                     "
N60 #PRINT"       TRIGGERED BY POWER, ERROR OR LOW BATTERY           "
N70 #PRINT"           PRESS <ENTER> TO CLEAR THE SCREEN              "
N80 #PRINT"                  FOLLOWED BY MANUAL.                     "
N90 #PRINT"**********************************************************"
N100 #PRINT""
N110 #PRINT""
N120 #INPUT V100
N130 #WAIT
N140 M99
%
