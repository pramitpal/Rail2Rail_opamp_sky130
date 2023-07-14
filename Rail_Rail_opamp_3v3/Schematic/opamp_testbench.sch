v {xschem version=3.4.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 -340 -810 550 -100 {flags=graph
y1=-0.366676

ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=0.01
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vout
vin"
color="4 5"
dataset=-1
unitx=1
logx=0
logy=0
y2=3.66941}
N 80 40 100 40 {
lab=VIN}
N 400 80 420 80 {
lab=VOUT}
C {sky130_fd_pr/corner.sym} 620 -130 0 0 {name=CORNER only_toplevel=false corner=tt}
C {devices/simulator_commands_shown.sym} 610 110 0 0 {name=Transient_analysis
simulator=ngspice
spice_ignore=false
only_toplevel=false 
value="
v1 vssa 0 dc 0
v2 vdda 0 dc 3.3
V3 VIN 0 SIN(1.65 1.65 1k 0)
.save all
.tran 0.1m 10m
**** interactive sim
.control
run
*set filetype=ascii
set filetype=binary
write opamp_testbench.raw all
*plot vout
exit
.endc
"}
C {devices/lab_pin.sym} 400 60 0 1 {name=p3 lab=VSSA}
C {devices/lab_pin.sym} 80 40 0 0 {name=p1 lab=VIN}
C {devices/lab_pin.sym} 420 80 2 0 {name=p2 lab=VOUT}
C {devices/lab_pin.sym} 400 40 0 1 {name=p4 lab=VDDA}
C {devices/launcher.sym} 650 -330 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/opamp_testbench.raw tran"
}
C {opamp.sym} 250 60 0 0 {name=x1}
