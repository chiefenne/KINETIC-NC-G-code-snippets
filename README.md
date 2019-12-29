
# KINETIC-NC Facing Macro (Planfräsen)

A face milling G-code macro for the [HIGH-Z S-720/T](https://www.cnc-step.de/cnc-fraese-high-z-s-720t-kugelgewindetrieb-720x420mm) milling machine running the [KINETIC-NC](https://www.cnc-step.de/cnc-software/kinetic-nc-netzwerk-steuerungssoftware/) software, which both are from [CNC-Step](https://www.cnc-step.de).

## Features

 * Automatic facing cycle (meandering) for stock facing
 * Inputs:
   - Length
   - Width
   - Overlap (extends the length /width rectangle)
   - Lateral step (should be less than tool diameter)
   - Depth of cut
   - Feed rate
 * Facing starts at WCS G54

**NOTE:** When using some more advanced calculations with variables, KINETIC-NC sometimes reports false messages with respect to machine limits, etc. When all inputs are correct, the machine runs the macro correctly as well, despite wrong warnings. Nevertheless, when you get warnings, its at your own risk if you run the code, as there might be programming errors or wrong inputs.