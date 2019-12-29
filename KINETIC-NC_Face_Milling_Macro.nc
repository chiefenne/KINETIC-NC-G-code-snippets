
Face milling macro for the KINETIC-NC software
Makes a meandering toolpath with respect to given inputs
Allows dry run

%

G21 (metric)
G90 (absolut coordinates)
G94 (Feed in mm/min)
G53 (Maschine zero)

ASKFLT "Enter LENGTH (mm)" 0=min 720=max
#103=#0
ASKFLT "Enter WIDTH (mm)" 0=min 420=max
#104=#0
ASKFLT "Enter OVERLAP (mm)" 0=min 20=max
#105=#0
ASKFLT "Enter LATERAL STEP (mm)" 0=min 100=max
#106=#0
ASKFLT "Enter DEPTH OF CUT (mm)" 0=min 5=max
#107=#0
ASKFLT "Enter FEED RATE (mm/min)" 100=min 2500=max
#108=#0

#108=1500 (Feed rate mm/min)
#109=#103+2*#105
#110=ROUND(#104/#106)+1

PRINT "MEANDER:  Repeat = ";#110
PRINT "MEANDER:  Overall length = ";#109
PRINT "MEANDER:  Overall width= ";#104+2*#105
PRINT "MEANDER:  Lateral step= ";#106
PRINT "MEANDER:  Depth of cut = ";#107
PRINT "MEANDER:  Feed rate = ";#108

ASKBOOL "MEANDER: For Testing (no Z-Feed) click NO" I=2

G53
G0 Z0
G0 X0 Y0
G0 X=#900

G54
G0 X0 Y0
G0 X=-#105 Y=-#105

IF #0=1 THEN
  G0 Z30
  G1 Z=#107 F200
ENDIF
IF #0=0 THEN
  PRINT "MEANDER:  RUNNING TEST ONLY"
ENDIF

G1 F=#108

REPEAT=#110

  G1 X=#103+2*#105
  #111=Y+#106
  IF #111 < (#104+2*#105) THEN
    G1 Y=#111
  ELSE
    PRINT "MEANDER: Ending as Y-Limit is reached"
    SKIP Q0001
  ENDIF

  G1 X=-#105
  #111=Y+#106
  IF #111 < (#104+2*#105) THEN
    G1 Y=#111
  ELSE
    PRINT "MEANDER: Ending as Y-Limit is reached"
    SKIP Q0001
  ENDIF

NEXT

Q0001:

G53
G0 Z0

G54
G0 Y0
G0 X0

G53
G0 Y0
G0 X0

M30
