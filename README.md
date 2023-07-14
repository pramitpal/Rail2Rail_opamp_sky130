# Rail2Rail_opamp_sky130
Rail-Rail Opamp using sky130nm PDK

Rail-to-rail opamps, with input/output and high-speed operation make them ideal for driving sampling Analog-to-Digital Converters (ADC). They are also well suited for general-purpose and audio applications and providing I/V conversion at the output of igital-to-Analog Converters(DAC). 
They are optimized to operate on a single supply as low as 1.8V with an input common-mode voltage range that extends all the way to the supplies.

## Skywater 130 pdk
The SkyWater Open Source PDK is a collaboration between Google and SkyWater Technology Foundry to provide a fully open source Process Design Kit and related resources, which can be used to create manufacturable designs at SkyWater’s facility.

The SkyWater Open Source PDK documentation can be found at <https://skywater-pdk.rtfd.io>

## Rail-to-Rail opamp 3.3v
The schematic for the 3.3v version is shown below
![img](/Rail_Rail_opamp_3v3/Schematic/opamp_schematic.svg)
The pre-layout simulation waveform and Vin vs Vout characteristics isshown in the figure below
![img](/Rail2Rail_opamp_3.3v/schematic/pre-layout.png)

To draw the layout using magic VLSI tool. it needs to be invoked by
```
magic -rcfile sky130A.magicrc -d XR
```
The layout for 3.3v version

![img](/Rail_Rail_opamp_3v3/Layout/opamp_layout.png)


The postlayout simulation waveform
![img](/Rail2Rail_opamp_3.3v/gds/post-layout.png)
As you can see the pre-layout and post layout simulations for the 3.3v version are also identical.
