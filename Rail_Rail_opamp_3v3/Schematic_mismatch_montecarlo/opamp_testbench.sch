v {xschem version=3.4.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 -340 -810 550 -100 {flags=graph
y1=-0.699916

ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.00116967
x2=0.00221144
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vout
vin"
color="4 5"
dataset=2
unitx=1
logx=0
logy=0
y2=2.04253
hilight_wave=1}
N 80 40 100 40 {
lab=VIN}
N 400 80 420 80 {
lab=VOUT}
N 270 170 270 190 {lab=TEMPERAT}
C {devices/simulator_commands_shown.sym} 580 70 0 0 {name=Transient_analysis
simulator=ngspice
spice_ignore=true
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
C {devices/lab_pin.sym} 400 60 0 1 {name=p3 lab=VSS}
C {devices/lab_pin.sym} 80 40 0 0 {name=p1 lab=VIN}
C {devices/lab_pin.sym} 420 80 2 0 {name=p2 lab=VOUT}
C {devices/lab_pin.sym} 400 40 0 1 {name=p4 lab=VCC}
C {devices/launcher.sym} 650 -330 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/opamp_testbench.raw tran"
}
C {opamp.sym} 250 60 0 0 {name=x1}
C {devices/code_shown.sym} 890 -250 0 0 {name=MONTE_CARLO only_toplevel=false spice_ignore=false value=
"
** this experimental option enables mos model bin 
** selection based on W/NF instead of W
*.option chgtol=4e-16 method=gear

*.param VCCGAUSS = agauss(3.3, 0.05, 1)
*.param VCC = 'VCCGAUSS'
** use following line to remove VCC variations
.param VCC = 3.3

.param TEMPGAUSS = agauss(40, 30, 1)
.option temp = 'TEMPGAUSS'
** use following line to remove temperature variations
*.option temp = 25

.control
  option seed = 8
  let run = 1
  save all
  op
  write /foss/designs/Rail_Rail_opamp_3v3/Schematic_mismatch_montecarlo/simulation/opamp_testbench.raw
  reset
  set appendwrite
  dowhile run < = 10
    *save Vin temperat vcc vss vout
    save all
    tran 1u 10m uic
    *dc Vin 0 3.3 0.01
    write /foss/designs/Rail_Rail_opamp_3v3/Schematic_mismatch_montecarlo/simulation/opamp_testbench.raw
    let run = run + 1
    reset
  end
.endc
"}
C {sky130_fd_pr/corner.sym} 870 -450 0 0 {name=CORNER2 only_toplevel=true corner=tt_mm}
C {devices/vsource.sym} 60 220 0 0 {name=Vin value="SIN(1.65 1.65 1k 0)"}
C {devices/lab_pin.sym} 60 190 3 1 {name=p5 sig_type=std_logic lab=VIN}
C {devices/lab_pin.sym} 60 250 3 0 {name=p7 lab=VSS}
C {devices/vsource.sym} 130 220 0 0 {name=VVSS value=0}
C {devices/lab_pin.sym} 130 190 1 0 {name=p6 lab=VSS}
C {devices/lab_pin.sym} 130 250 0 0 {name=p8 lab=0}
C {devices/vsource.sym} 200 220 0 0 {name=VVCC value=VCC}
C {devices/lab_pin.sym} 200 190 1 0 {name=p32 lab=VCC}
C {devices/lab_pin.sym} 200 250 0 0 {name=p33 lab=0}
C {devices/vsource_arith.sym} 270 220 0 0 {name=E5 VOL=temper MAX=200 MIN=-200}
C {devices/lab_pin.sym} 270 170 0 1 {name=p113 lab=TEMPERAT}
C {devices/lab_pin.sym} 270 250 3 0 {name=p114 lab=VSS}
C {devices/noconn.sym} 270 170 0 0 {name=l12}
