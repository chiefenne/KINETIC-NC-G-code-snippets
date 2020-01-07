
# KINETIC-NC Facing Macro (Planfräsen)

A face milling G-code macro for the [KINETIC-NC](https://www.cnc-step.de/cnc-software/kinetic-nc-netzwerk-steuerungssoftware/) software from [CNC-Step](https://www.cnc-step.de).

<img src="User03_BIG.png" width="300">

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

**NOTE:** When using some more advanced calculations with variables, KINETIC-NC sometimes reports false messages with respect to machine limits, etc. When all inputs are correct, the machine still runs the macro correctly, despite wrong warnings.

**NOTE:** When you get warnings, its at your own risk if you run the code, as there might be programming errors or wrong inputs.