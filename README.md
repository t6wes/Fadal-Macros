# Fadal Programs

Here are a few programs I use on my Fadal mill. The Fusion 360 posts take advantage of Renishaw probing macros for Fadal, custom skipblock fuction and Accublast coolant nozzle support.

>[!NOTE]
>Tested on VMC 15
>- 1400-5 CPU Board
>- 1460-4C 16MB Memory
>- Renishaw OMP40
>- Renishaw TS27R
>- Renishaw OMI
>- Renishaw HSI Interface | A-5500-1000

>[!NOTE]
>Todo for Fusion post
>- Update to use new shared content
>- Figure out how to only turn on/off probe at beginning/end of multiple cycles


## Accublast

Accublast remote control CNC coolant nozzle

[Betz Technik - Accublast](https://www.betztechnik.ca/store/p41/Accublast_remote_control_CNC_coolant_nozzle.html)

### O9001 ACCUBLAST

This will pulse pin 6 on 1040-2A card. I used a IDC26P 26Pin Male Header Breakout Board and drive a solid state relay (Phoenix 2967989).

**This is what is added to Fusion post**

````
if (getProperty("hasAccublast")) {
    writeBlock(mFormat.format(98), "P" + 9001, "R1+"+toolFormat.format(tool.number)+"."); // Pulse for accublast
    }
````
I put it within the "function onSection()" before the tool change and 
"function writeToolCycleBlock(tool)"

### O1208 Test

Test program that changes Accublast nozzle from tool 1, 12, 20, 35, 8 with 5 seconds in between.

## Renishaw Probing

### O9810 Safe Move

Safe move similar to HAAS renishaw macros. Stops movement if probe hits anything while moving.

**Example:**
````
(X, Y move at 100 feedrate)
R1+3.045 R2-2.1699 R4+100.
M98 P9810
M98 P9009
(Z Move at 50 feedrate)
R3+0.7545 R4+50.
M98 P9810
M98 P9009
````

### O9020 Start Up

Start up Renishaw probe. Checks two inputs to make sure probe error and battery are not triggered.

**Example:**
````
M98 P9020
M98 P9009
````
### O9030 Shutdown

Shutdown Renishaw probe

**Example:**
````
M98 P9030
M98 P9009
````

### O9740 Probe Error Alarm

Error program called by O9020 or O9030. It displays a full screen error print out.
