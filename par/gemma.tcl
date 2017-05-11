#######################################################
##                                                     #
##  Encounter Command File                             #
##                                                     #
##  Owner: austriamicrosystems                         #
##  HIT-Kit: Digital                                   #
##  version: 28-Mar-2011                               #
##                                                     #
########################################################

## Global variables
set consList {func test}

source amsSetup.tcl
set HOME $env(HOME)
set AMS_DIR $env(AMS_DIR)
 
if {[file exists "amsSetup.tcl"]} {
  source amsSetup.tcl
  print "---# TCL Script amsSetup.tcl loaded"
}

if {[file exists $HOME/.encounter_personal.tcl]} {
  source $HOME/.encounter_personal.tcl
  print "---# TCL Script $HOME/.encounter_personal.tcl loaded"
}

if {[file exists $AMS_DIR/artist/start_up/SOC_templates/userCreateZeroReg.tcl]} {
  source $AMS_DIR/artist/start_up/SOC_templates/userCreateZeroReg.tcl
}

proc ha {} {
    global consList
    amsHelp
    print "#### Additional Functions" 
    print "---#     - amsLoadCons cons ................. load timing constraints"
    print "---#                                             cons = $consList"
    print "---#     - amsFloorplan type util iodist ratio.... create floorplan:"
    print "---#                                             type = core|peri"
    print "---#                                             util = <utilization> e.g.: 0.75"
    print "---#                                             iodist = <distance core io> e.g.: 40.0"
    print "---#                                             ratio = width/height ratio; default=1.0 "
    print "---#     - amsDefIn defFile rowtype l t r b addwidth addheight......import DEF Floorplan File:"
    print "---#                                             deffile = DEF Filename"
    print "---#                                             rowtype = standard(default)|standard_3b"
    print "---#                                             l,r,t,b = boundary core distance on left,top,right,bottom side; default=2"
    print "---#                                             addwidth = additional width; default=0"
    print "---#                                             addheight = additional height; default=0"
    print "---#     - amsPowerRoute {powNetList} ....... power rings and followpin routing "
    print "---#                                             powNetList = {{<netname> <width>}..} e.g.: {{vdd! 4} {gnd! 3}}"
    print "---#     - amsTa state cons ................. run timing analysis at state: "
    print "---#                                             state = preCTS|postCTS|preRoute|postRoute"
    print "---#                                             cons = $consList"
    print "---#     - amsPlace type .................... run placement: "
    print "---#                                             type = ntd|td|opt|opt1|opt2|opt3|opt4"
    print "---#                                                    opt2.....best results with Encounter 7.1"
    print "---#                                                    opt3/4...best results with Encounter 8.1"
    print "---#     - amsCts ........................... run ClockTreeSynthesis"
    print "---#     - amsOpt state what cons ........... optimizes the design"
    print "---#                                             state = preCTS|postCTS|preRoute|postRoute"
    print "---#                                             what = setup|hold|drv"
    print "---#                                             cons  = $consList"
    print "---#     - amsSave postfix .................. saves design and adds postfix to name"
    print "---#     - amsPortList filename ............. write a list of ports with coordinates (can"
    print "---#                                          be imported into Virtuoso)"
    print "---#     - amsStat projname ................. creates Statistics of Design with free Projectname"
    print "---#     - amc start end .................... amsMakeChip"
    print "#### " 
    print "---# amc start end"
    print "---#    1 - amsDbSetup"
    print "---#    2 - amsUserGrid"
    print "---#    3 - amsGlobalConnect core"
    print "---#    4 - amsOpCond minmax"
    print "---#    5 - amsLoadCons func"
    print "---#    6 - amsFloorplan core 0.8 50"
    print "---#    7 - amsPowerRoute {{vdd! 20} {gnd! 20}}"
    print "---#    8 - amsAddEndCaps"
    print "---#    9 - amsPlace ntd"
    print "---#   10 - amsCts"
    print "---#   11 - amsTa postCTS {$consList}"
    print "---#   12 - amsOpt postCTS hold {$consList}"
    print "---#        amsOpt postCTS drv {$consList}"
    print "---#        amsTa postCTS {$consList}"
    print "---#   13 - amsFillcore"
    print "---#   14 - amsFillperi"
    print "---#   15 - amsRoute wroute"
    print "---#   16 - amsTa postRoute {$consList}"
    print "---#   17 - amsWrite final"
    print "---#   18 - amsWriteSDF"
    print "####"
} 

proc amc {start {end -1}} {
 if {$end == -1} { set end $start }
 for {set i $start} {$i<=$end} {incr i} {
   print "---# ---- Step $i -----"
   set step [format "s%d" $i]
   switch -exact $step {
   
      "s1"  { amsDbSetup }            
      "s2"  { amsUserGrid }           
      "s3"  { amsGlobalConnect core } 
      "s4"  { amsOpCond minmax }      
      "s5"  { amsLoadCons func }      
      "s6"  { amsFloorplan core 0.8 50 }
      "s7"  { amsPowerRoute  {{vdd! 20} {gnd! 20}} }
      "s8"  { amsAddEndCaps }       
      "s9"  { amsPlace ntd }       
      "s10" { amsCts }             
      "s11" { amsTa postCTS {func} }
      "s12" { amsOpt postCTS drv {func} }
      "s13" { amsFillcore }        
      "s14" { amsFillperi }        
      "s15" { amsRoute wroute }   
      "s16" { amsTa postRoute {func} }
      "s17" { amsWrite final }
      "s18" { amsWriteSDF }
     } 
  }
}

proc amsLoadCons type {
   global topcellname
   ## load timing constraints
   unloadTimingCon
   set filename [format "constraints/%s_%s.sdc" $topcellname $type]
   if {[file exists $filename]} {
        loadTimingCon $filename
   } else {
      print "-E-# $filename not found - no constraints loaded"
   }
}


proc amsFloorplan {type util iodist {ratio 1.0}} {
  ##-- Initialize floorplan
  switch $type {
     "core" {
              floorPlan -r $ratio $util $iodist $iodist $iodist $iodist
            }
     "peri" {
              floorPlan -r $ratio $util $iodist $iodist $iodist $iodist
              ##--- Load corner io file to add corner cells (if necessary)
              loadIoFile corners.io

              ##-- Snap IO cells to user grid
              snapFPlanIO -usergrid
            }
  }
  ##-- Place Macros 
  ##-- Create Placement Blockages
  ##createObstruct llx lly urx ury 
  ##-- Cut Rows under Macros, Halos and Blockages
  ##cutCoreRow
  fit
}

proc amsPowerRoute {{pownetsList {}}} {
   set offset 0.8
   set spacing 0.8
   # foreach power net inthe specified list
   # route a ring
   foreach pownet $pownetsList {
      set name [lindex $pownet 0]
      set width [lindex $pownet 1]
      print "----$name $width $offset----"
      addRing \
                  -width_left   $width -spacing_left   $spacing -offset_left   $offset -layer_left   MET2 \
	          -width_top    $width -spacing_top    $spacing -offset_top    $offset -layer_top    MET1 \
	          -width_right  $width -spacing_right  $spacing -offset_right  $offset -layer_right  MET2 \
	          -width_bottom $width -spacing_bottom $spacing -offset_bottom $offset -layer_bottom MET1 \
	          -stacked_via_top_layer MET4 \
	          -stacked_via_bottom_layer MET1 \
	          -around core \
	          -jog_distance 0.7 \
	          -threshold 0.7 \
	          -nets $name
      set offset [ expr $offset + $spacing + $width]
   }
   # do followpin routing
   sroute -noPadRings -jogControl { preferWithChanges differentLayer }
}


proc amsTa {state consList} {

    global topcellname
    foreach cons $consList {
       amsLoadCons $cons 
       set filename [format "%s_%s" $cons $state]
       switch $state {
         "prePlace" {timeDesign -prePlace -prefix $filename -outDir timingReports -timingDebugReport }
         "preCTS" {timeDesign -preCTS -prefix $filename -outDir timingReports-timingDebugReport }
         "postCTS" {timeDesign -postCTS -prefix $filename -outDir timingReports -timingDebugReport
                    timeDesign -postCTS -hold -prefix $filename -outDir timingReports -timingDebugReport
                   }
         "postRoute" {timeDesign -postRoute -prefix $filename -outDir timingReports -timingDebugReport
                    timeDesign -postRoute -hold -prefix $filename -outDir timingReports -timingDebugReport
                   }
         "signOff" {timeDesign -signOff -prefix $filename -outDir timingReports -timingDebugReport
                    timeDesign -signOff -hold -prefix $filename -outDir timingReports -timingDebugReport
                   }
       }
   }

}


proc amsPlace how {
   ##-- Placement
   switch $how {
      "ntd"   { 
                 setPlaceMode -timingdriven false -reorderScan false -congEffort medium \
                              -doCongOpt false -modulePlan false
                 placeDesign -noPrePlaceOpt
              }
      "td"    { 
                 setPlaceMode -timingdriven true -reorderScan false -congEffort medium \
                              -doCongOpt false -modulePlan false
                 placeDesign -noPrePlaceOpt
              }
      "opt"   {
                 setPlaceMode -timingdriven true -reorderScan false -congEffort high \
                              -doCongOpt -modulePlan false
                 placeDesign -inPlaceOpt -noPrePlaceOpt
              }
      "opt1"  {
                 setPlaceMode -congEffort high 
                 setPlaceMode -timingDriven true 
                 setPlaceMode -reorderScan true 
                 setPlaceMode -ignoreScan true 
                 setTrialRouteMode -useM1 true 
                 setTrialRouteMode -highEffort true
                 
                 setPlaceMode -modulePlan true
                 placeDesign -inPlaceOpt -noPrePlaceOpt
                 placeDesign -incremental
                 placeDesign -incremental
              }
      "opt2"  {
                 setPlaceMode -congEffort high 
                 setPlaceMode -timingDriven true 
                 setPlaceMode -reorderScan true 
                 setPlaceMode -ignoreScan true 
                 setTrialRouteMode -useM1 true 
                 setTrialRouteMode -highEffort true
                 
                 setPlaceMode -modulePlan 1
                 placeDesign -inPlaceOpt -noPrePlaceOpt
                 placeDesign -incremental
                 placeDesign -incremental
                 
                 refinePlace -wireLenOpt
                 refinePlace -wireLenOpt
                 refinePlace -wireLenOpt
                 trialRoute
                 congRepair
              }
      "opt3" {
                 setPlaceMode \
		            -congEffort         high \
		            -timingDriven       true \
		            -modulePlan         1 \
		            -doCongOpt          0 \
		            -clkGateAware       0 \
		            -powerDriven        0 \
		            -ignoreScan         0 \
		            -reorderScan        0 \
		            -ignoreSpare        1 \
		            -placeIOPins        1 \
		            -moduleAwareSpare   0 \
		            -preserveRouting    0 \
		            -rmAffectedRouting  0 \
		            -checkRoute         0 \
		            -swapEEQ            0 \
		            -wireLenOptEffort   high \
		            -congRepair         true \
                     -NMPadjustSpreadOutVioRatio 0.05 \
                     -checkPinLayerForAccess {  1 }
		
                 setTrialRouteMode \
		            -routeGuide             {} \
		            -selNet                 {} \
		            -selNetOnly             {} \
		            -highEffort             true \
		            -floorPlanMode          false \
		            -detour                 true \
		            -handlePreroute         true \
		            -autoSkipTracks         false \
		            -handlePartition        false \
		            -handlePartitionComplex false \
		            -useM1                  true \
		            -keepExistingRoutes     false \
		            -ignoreAbutted2TermNet  false \
		            -pinGuide               true \
		            -honorPin               false \
		            -selMarkedNet           false \
		            -selMarkedNetOnly       false \
		            -ignoreObstruct         false \
		            -PKS                    false \
		            -updateRemainTrks       true \
		            -ignoreDEFTrack         false \
		            -printWiresOnRTBlk      false \
		            -usePagedArray          false \
		            -routeObs               true \
		            -blockageCostMultiple   1 \
		            -maxDetourRatio         0

                 placeDesign -inPlaceOpt -prePlaceOpt

                 setPlaceMode \
		            -congEffort         high \
		            -timingDriven       false \
		            -modulePlan         1 \
		            -doCongOpt          0 \
		            -clkGateAware       0 \
		            -powerDriven        0 \
		            -ignoreScan         0 \
		            -reorderScan        0 \
		            -ignoreSpare        1 \
		            -placeIOPins        1 \
		            -moduleAwareSpare   0 \
		            -preserveRouting    0 \
		            -rmAffectedRouting  0 \
		            -checkRoute         0 \
		            -swapEEQ            0 \
		            -wireLenOptEffort   high \
		            -congRepair         true \
                     -NMPadjustSpreadOutVioRatio 0.05 \
		            -checkPinLayerForAccess {  1 }

		        placeDesign -incremental
		        placeDesign -incremental

                 refinePlace -wireLenOpt
                 refinePlace -wireLenOpt
                 refinePlace -wireLenOpt

     }
      "opt4" {
                 setPlaceMode \
		            -congEffort         high \
		            -timingDriven       true \
		            -modulePlan         1 \
		            -doCongOpt          0 \
		            -clkGateAware       0 \
		            -powerDriven        0 \
		            -ignoreScan         1 \
		            -reorderScan        1 \
		            -ignoreSpare        1 \
		            -placeIOPins        1 \
		            -moduleAwareSpare   0 \
		            -preserveRouting    0 \
		            -rmAffectedRouting  0 \
		            -checkRoute         0 \
		            -swapEEQ            0 \
		            -wireLenOptEffort   high \
		            -congRepair         true \
                     -checkPinLayerForAccess {  1 }
		
                 setTrialRouteMode \
		            -routeGuide             {} \
		            -selNet                 {} \
		            -selNetOnly             {} \
		            -highEffort             true \
		            -floorPlanMode          false \
		            -detour                 true \
		            -handlePreroute         true \
		            -autoSkipTracks         false \
		            -handlePartition        false \
		            -handlePartitionComplex false \
		            -useM1                  true \
		            -keepExistingRoutes     false \
		            -ignoreAbutted2TermNet  false \
		            -pinGuide               true \
		            -honorPin               false \
		            -selMarkedNet           false \
		            -selMarkedNetOnly       false \
		            -ignoreObstruct         false \
		            -PKS                    false \
		            -updateRemainTrks       true \
		            -ignoreDEFTrack         false \
		            -printWiresOnRTBlk      false \
		            -usePagedArray          false \
		            -routeObs               true \
		            -blockageCostMultiple   1 \
		            -maxDetourRatio         0

                 placeDesign -inPlaceOpt

                 congOpt -nrIterInCongOpt 3

     }
   }
   amsSave placed

}

proc amsCts {} {
   global topcellname
   set filename [format "constraints/%s.ctstch" $topcellname]
   ##-- Specify Clock tree
   specifyClockTree -clkfile $filename

   ##-- delete existing buffers
   #deleteClockTree -clk  <clockroot>

   ##-- Run CTS
   set filename1 [format "%s_cts.guide" $topcellname]
   set filename2 [format "%s_cts.ctsrpt" $topcellname]
   ckSynthesis -rguide $filename1 -report $filename2

   amsSave clkplaced
}


proc amsOpt {state what cons} {
   unloadTimingCon
   amsLoadCons $cons
   setOptMode -yieldEffort none
   setOptMode -highEffort
   setOptMode -maxDensity 0.95
   setOptMode -drcMargin 0.0
   setOptMode -holdTargetSlack 0.0 -setupTargetSlack 0.0
   setOptMode -noSimplifyNetlist
   clearClockDomains
   setClockDomains -all
   setOptMode -noUsefulSkew
   optDesign -$state -$what
}


proc amsIncrRoute {maxerror logfilenr} {
  set fehler  1000
  set filename [format "encounter.log%d" $logfilenr]
  clearDrc
  while {$fehler > $maxerror} {
     wroute -mode incrGlobalAndFinal
     set chan [open $filename]
     while {[gets $chan line] >= 0} {
         if {[scan $line "Total number of violations           =        %d" f] == 1} {
            set fehler $f
         }
     }
     print "---# Still $fehler errors - starting wroute again"
     close $chan
  }
}

proc amsDefIn { defFile {rowtype "standard"} {l 2} {t 2} {r 2} {b 2} {addwidth 0} {addheight 0}} {
  
  global topcellname

  # open DEF File
  # find diearea
  set chan [open $defFile]
  while {[gets $chan line] >= 0} {
     # units for dividing coordinates
     if {[scan $line " UNITS DISTANCE MICRONS %d" u] == 1} {
            set units $u
	    print "---# DEF Units: $units"
     }
     # diearea 
     if {[scan $line " DIEAREA ( %f %f ) ( %f %f )" x1 y1 x2 y2] == 4} {
         set llx [expr ($x1 / $units)]
	 set lly [expr $y1 / $units]
	 set urx [expr $x2 / $units]
	 set ury [expr $y2 / $units]
	 print "---# DEF DieArea: $llx:$lly/$urx:$ury"
     }
  }
  close $chan
  # calculate core area for rows
  set llxc [expr $llx + $l]
  set llyc [expr $lly + $b]
  set urxc [expr $urx - $r]
  set uryc [expr $ury - $t]
  #floorPlan -b $llx $lly $urx $ury 
  floorPlan -site $rowtype -b $llx $lly $urx $ury \
                                   $llx $lly $urx $ury \
                                   $llxc $llyc $urxc $uryc
  # load def file
  defIn $defFile


  # if the die size should be changed
  if {$addwidth != 0 || $addheight != 0} {
     print "---# Adding width: $addwidth"
     print "---# Adding height: $addheight"
     # write IO-File to get a pin locations file
     set filename [format "%s_save.io" $topcellname]
     saveIoFile -locations $filename

     # new die sizes
     set llx [expr $x1 / $units]
     set lly [expr $y1 / $units]
     set urx [expr ($x2 / $units) + $addwidth]
     set ury [expr ($y2 / $units) + $addheight]
     set llxc [expr $llx + $l]
     set llyc [expr $lly + $b]
     set urxc [expr $urx - $r]
     set uryc [expr $ury - $t]
     floorPlan -site $rowtype -b $llx $lly $urx $ury \
                                 $llx $lly $urx $ury \
                                 $llxc $llyc $urxc $uryc
     # load pin positions
     loadIoFile $filename
 
  }

}

proc amsPortList {filename} {
  print "---# Write PinList to File: $filename"
  deselectAll
  selectIOPin *
  reportSelect
  deselectAll
  print "---# End Write PinList"
  print "---# Writing Ports to File now: $filename"

  set logFile [getLogFileName]


  set pins 0
  set chan [open $logFile]
  while {[gets $chan line] >= 0} {
     if {[regexp "<CMD" $line] != 1 &&[regexp "Write PinList to File" $line] == 1} {
        set pins 1
        set ochan [open $filename w]
        set nrofpins 0
     }
     if {$pins == 1} {
       if {[scan $line " Name : %s " n] == 1} {
         set pinname $n
       }
       if {[scan $line " Layer : %s " l] == 1} {
         set pinlayer $l
       }
       if {[scan $line " Location : %f %f " x y] == 2} {
         set xCoord $x
         set yCoord $y
         puts $ochan "$pinname $pinlayer $xCoord $yCoord"
         incr nrofpins
       }
     }
     if {[regexp "<CMD" $line] != 1 && [regexp "End Write PinList" $line] == 1} {
        set pins 0
        close $ochan
     }
  }
  print "---# $nrofpins Ports found"


}


proc amsPowerAnalysis {net {volt 3.3} {opcond TYPICAL} {mhz 10}} {


   global topcellname

   # write input files for vstorm
   # DEF
   set deffilename [format "vstorm/%s.def" $topcellname]
   defOut -routing $deffilename

   # SPEF
   set filename [format "vstorm/%s.rcdb" $topcellname]
   setExtractRCMode -engine detail -rcdb $filename 
   setXCapThresholds -totalCThreshold 5.0 -relativeCThreshold 0.01
   extractRC
   set filename [format "vstorm/%s.spef" $topcellname]
   rcOut -spef $filename

   # TWF
   timeDesign -postRoute
   set filename [format "vstorm/%s.twf" $topcellname]
   write_timing_windows -pin $filename

   # run powermeter
   system echo "set VOLT $volt" > pmeter.cmd
   system echo "set OPCOND $opcond" >> pmeter.cmd
   system echo "set MHZ $mhz" >> pmeter.cmd
   system echo "set NET $net" >> pmeter.cmd
   system cat vstorm/pmeter.cmd >> pmeter.cmd

   print "---# Running powermeter using command file pmeter.cmd\n"
   system powermeter pmeter.cmd

   # run VoltageStorm
   set filename1 [format "%s.%sV.irdrop.custom" $topcellname $volt]
   set filename2 [format "vstorm/%s.pp" $topcellname]
   set outdir [format "vstorm/vs_%s" $volt]
   set lowlim [expr $volt - $volt/20]
   system rm -rf '$outdir'

   print "---# Running VoltageStorm\n"

   runVStorm -psoAONet {} \
             -ivFile $filename1 \
             -msmvNet {} \
             -biasVolt $volt \
             -analyzePI 0 \
             -net $net \
             -cpfMode {} \
             -psoSONet {} \
             -analyzePV 0 \
             -powerNetGroup {} \
             -voltLimit $lowlim \
             -psoPiDetailFile {} \
             -ppFile $filename2 \
             -psoAOIR {} \
             -psoAOVolt {} \
             -libs {/softslin/AMS_410_CDS/voltagestorm/c35/libs/c35b4/pv/CORELIB \
                    /softslin/AMS_410_CDS/voltagestorm/c35/libs/c35b4/dv/IOLIB_4M} \
             -currentFile vstorm/workdir/static_$net.ptiavg \
             -psoPiInstFile {} \
             -psoSFNet {} \
             -fe2LefLayerNameMap {} \
             -outDir $outdir \
             -keepTempFiles 1 \
             -msmvBiasVolt {}
#	    -vsBeginIncludeFile vstorm.inc

   clearRailAnalysisDisplay
   set indir [format "%s/%s_25C_avg_1" $outdir $net]
   set step [expr ($volt-$lowlim)/8]
   set f1 [expr $volt-$step]
   set f2 [expr $f1-$step]
   set f3 [expr $f2-$step]
   set f4 [expr $f3-$step]
   set f5 [expr $f4-$step]
   set f6 [expr $f5-$step]
   set f7 [expr $f6-$step]
   set filter [format "\{1 $f1 $volt\} \{1 $f2 $f1\} \{1 $f3 $f2\} \{1 $f4 $f3\} \{1 $f5 $f4\} \{1 $f6 $f5\} \{1 $f7 $f6\} \{1 0 $f7\}"]
   print "filter: $f1 $f2 $f3 $f4 $f5 $f6 $f7\n";
   print "$filter\n";
   displayRailAnalysisResults -violationBrowser -net $net \
             -type ir -inDir  $indir\
	     -filter "1 $f1 $volt" \
	             "1 $f2 $f1" \
		     "1 $f3 $f2" \
		     "1 $f4 $f3" \
		     "1 $f5 $f4" \
		     "1 $f6 $f5" \
		     "1 $f7 $f6" \
		     "1 0 $f7"\
             -visibleLayer M3 M2 M1


   system cat vstorm/workdir/ctype.rpt
   print "####\n"
   print "---# Power Analysis finished\n"
   print "---# power consumption reports:\n"
   print "---#    * vstorm/workdir/powermeter.pwr - all cells\n"
   print "---#    * vstorm/workdir/ctype.rpt      - cell groups\n"
   print "---#    * vstorm/workdir/cpw.out        - clock tree\n"
   print "---# Analysis Images: vstorm/vs_$volt/${net}_25C_avg_1/*.gif\n"
   print "####\n"

    
}

proc amsStat projname {
   global topcellname

   set statdir [format "%s_%s_stat" $projname $topcellname]
   print "####"
   print "---# Creating Statistics in directory $statdir";
   system mkdir -p $statdir
   print "---#    Directory $statdir created";
   print "---#    running defStat.pl -> $statdir/$statdir.txt";
   defOut -floorplan -netlist -routing $statdir/$topcellname.def
   system defStatv2.pl -d $statdir/$topcellname.def \
                       -p $projname \
                       -t c35b4 \
          /softslin/AMS_410_CDS/artist/HK_C35/LEF/c35b4/CORELIB.lef /softslin/AMS_410_CDS/artist/HK_C35/LEF/c35b4/IOLIB_4M.lef \
		       ./LEF/*.lef > $statdir/$statdir.txt
   system mv bar.html $statdir
   print "---#    Creating Screen Dump $statdir/$topcellname.gif";
   fit
   dumpToGIF $statdir/$topcellname.gif
   print "---#    Creating Wire Statistics $statdir/$topcellname.wires";
   reportWire -detail $statdir/$topcellname.wires
   print "---# Finished";
   print "####"

}

  print "---# TCL Script gemma.tcl loaded"
##-- End of First Encounter TCL command file

