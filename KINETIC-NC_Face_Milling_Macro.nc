#NAME User03.txt #LABEL "FACING"

Face milling macro for the KINETIC-NC software
Makes a meandering toolpath with respect to given inputs
Allows dry run

%

G21 (metric)
G90 (absolut coordinates)
G94 (Feed in mm/min)
G53 (Maschine zero)

ASKFLT "Enter LENGTH (mm)" I=0 J=720
#103=#0
ASKFLT "Enter WIDTH (mm)" I=0 J=420
#104=#0
ASKFLT "Enter OVERLAP (mm)" I=0 J=20
#105=#0
ASKFLT "Enter LATERAL STEP (mm)" I=0 J=100
#106=#0
ASKFLT "Enter DEPTH OF CUT (mm)" I=0 J=5
#107=#0
ASKFLT "Enter FEED RATE (mm/min)" I=100 J=7200
#108=#0
ASKFLT "Spindle speed (rpm)" I=1000 J=26000
#112=#0

#109=#103+2*#105
#110=ROUND(#104/#106)+1

PRINT "FACING:  Repeat = ";#110
PRINT "FACING:  Length (incl. overlap) = ";#109+2*#105
PRINT "FACING:  Width (incl. overlap) = ";#104+2*#105
PRINT "FACING:  Lateral step = ";#106
PRINT "FACING:  Depth of cut = ";#107
PRINT "FACING:  Feed rate = ";#108
PRINT "FACING:  Spindle speed = ";#112

ASKBOOL "FACING: For Testing (no Z-Feed) click NO" I=2

G53
G0 Z0
G0 X0 Y0
G0 X=#900

G54
G0 X0 Y0
G0 X=-#105 Y=-#105

IF #0=0 THEN
  PRINT "FACING:  RUNNING TEST ONLY"
ENDIF

IF #0=1 THEN
  M3 S=#112
  G0 Z10 F600
  G1 Z=-#107 F200
ENDIF

#115=0

REPEAT=#110

  G1 F=#108

  G1 X=#103+2*#105
  #111=Y+#106
  IF #111 < (#104+2*#105) THEN
    G1 Y=#111
    #115=#115+1
    PRINT "FACING: Pass number =";#115
  ELSE
    PRINT "FACING: Ending as Y-Limit is reached"
    SKIP Q0001
  ENDIF

  G1 F=#108

  G1 X=-#105
  #111=Y+#106
  IF #111 < (#104+2*#105) THEN
    G1 Y=#111
    #115=#115+1
    PRINT "FACING: Pass number =";#115
  ELSE
    PRINT "FACING: Ending as Y-Limit is reached"
    SKIP Q0001
  ENDIF

NEXT

Q0001:

G53
G0 Z0

M5 (Spindle off)

G54
G0 Y0
G0 X0

G53
G0 Y0
G0 X0

M30 (end program and rewind)

Simulation: 
PRINT "FACING the stock (simulation)"
RETURN
