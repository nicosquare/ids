#######################################################
##                                                     #
##  Encounter Command File                             #
##                                                     #
##  Owner: austriamicrosystems                         #
##  HIT-Kit: Digital                                   #
##  version: 03-Nov-2009                               #
##                                                     #
########################################################

## Global variables
set topcellname "none"
set dbdir "DB"

proc amsHelp {} {
    print "#### Available Functions" 
    print "---#     - amsDbSetup....................... Setup Database - read Config"
    print "---#     - amsUserGrid...................... Sets the grid for the IO-Cells"
    print "---#     - amsGlobalConnect type............ connects global nets: "
    print "---#                                               type = core | both"
    print "---#     - amsAddEndCaps.................... place Caps"
    print "---#     - amsOpCond cond.................... set operating condintions: "
    print "---#                                               cond = typ|minmax|min|max"
    print "---#     - amsFillcore ...................... places core filler cells"
    print "---#     - amsFillperi ...................... places periphery filler cells"
    print "---#     - amsRoute router................... run routing with: "
    print "---#                                               router = nano|wroute|wroute2(using 2CPUs)"
    print "---#     - amsWrite postfix ................. writes GDS, Verilog NL, SPEF, DB"
    print "---#     - amsWriteSDF ...................... write combined SDF for all 3 cases"
    print "---#     - amsWriteSDF4View viewList......... write SDF for all analysis views in list"
    print "---#     - amsZoomTo x y .................... zooms to coordinates x y"
    print "#### " 
} 

proc amsMakeChip {} {
   ##--- Load configuration file
   amsDbSetup

   ##--- Set User Grid
   amsUserGrid

   ##--- make global connections
   amsGlobalConnect both

}

proc amsDbSetup {} {
   ##--- Load configuration file
   loadConfig c35b4_std.conf 0
   commitConfig
}


proc amsUserGrid {} {
   ##--- Set user grids
   setPreference ConstraintUserXGrid 0.1
   setPreference ConstraintUserXOffset 0.1
   setPreference ConstraintUserYGrid 0.1
   setPreference ConstraintUserYOffset 0.1
   setPreference SnapAllCorners 1
   setPreference BlockSnapRule 2

   snapFPlanIO -usergrid
}

proc amsGlobalConnect type {
   ##--- Define global power connects
   switch $type {
      "core" {
               ##--- Define global Power nets - make global connections
               clearGlobalNets
               globalNetConnect vdd! -type pgpin -pin vdd! -inst * -module {}
               globalNetConnect gnd! -type pgpin -pin gnd! -inst * -module {}
             }
      "both" {
               ##--- Define global Power nets - make global connections
               clearGlobalNets
               globalNetConnect vdd! -type pgpin -pin vdd! -inst * -module {}
               globalNetConnect gnd! -type pgpin -pin gnd! -inst * -module {}
               globalNetConnect vdd3o! -type pgpin -pin vdd3o! -inst * -module {}
               globalNetConnect vdd3r1! -type pgpin -pin vdd3r1! -inst * -module {}
               globalNetConnect vdd3r2! -type pgpin -pin vdd3r2! -inst * -module {}
               globalNetConnect gnd3o! -type pgpin -pin gnd3o! -inst * -module {}
               globalNetConnect gnd3r! -type pgpin -pin gnd3r! -inst * -module {}
             }
     }
}

proc amsOpCond cond {

    switch $cond {
      "typ" { 
             setOpCond -min TYPICAL -minLibrary c35_CORELIB \
	               -max TYPICAL -maxLibrary c35_CORELIB 
#		       -powerDomain normal
#             setOpCond -min TYPICAL -minLibrary c35_CORELIB \
#	               -max TYPICAL -maxLibrary c35_CORELIB \
#		       -powerDomain modulator
          } 
      "minmax" {
             setOpCond -min BEST-MIL -minLibrary c35_CORELIB \
	               -max WORST-MIL -maxLibrary c35_CORELIB 
#	               -powerDomain normal
#             setOpCond -min BEST-MIL -minLibrary c35_CORELIB_3B_1.8V_min \
#	               -max WORST-MIL -maxLibrary c35_CORELIB_3B_1.8V_max \
#		       -powerDomain modulator
      }
      "min" {
             setOpCond -min BEST-MIL -minLibrary c35_CORELIB \
	               -max BEST-MIL -maxLibrary c35_CORELIB 
      }
      "max" {
             setOpCond -min WORST-MIL -minLibrary c35_CORELIB \
	               -max WORST-MIL -maxLibrary c35_CORELIB 
      }
   } 
}


proc amsAddEndCaps {} {
   ##-- add CAP cells
   addEndCap -preCap ENDCAPL -postCap ENDCAPR -prefix ENDCAP
}

proc amsFillcore {} {
   ##-- Add Core Filler cells
   source fillcore.tcl
   ## or
   ##addFiller -cell FILL25 FILL10 FILL5 FILL2 FILL1 -prefix FILLER
   ##addFiller -cell FILLRT25 FILLRT10 FILLRT5 FILLRT2 FILLRT1 -prefix FILLERRT
}

proc amsFillperi {} {
   ##-- Add Peri Filler cells
   source fillperi.tcl
}

proc amsRoute {{router wroute}} {
    switch $router {
      "nano" { 
               ##-- Run Routing
               ##-- Nano-Route
               getNanoRouteMode -quiet
               getNanoRouteMode -quiet envSuperThreading
               setNanoRouteMode -quiet -drouteFixAntenna true
               setNanoRouteMode -quiet -routeInsertAntennaDiode false
               setNanoRouteMode -quiet -timingEngine CTE
               setNanoRouteMode -quiet -routeWithTimingDriven false
               setNanoRouteMode -quiet -routeWithEco false
               setNanoRouteMode -quiet -routeWithSiDriven false
               setNanoRouteMode -quiet -routeTdrEffort 2
               setNanoRouteMode -quiet -routeSiEffort normal
               setNanoRouteMode -quiet -routeWithSiPostRouteFix false
               setNanoRouteMode -quiet -drouteAutoStop true
               setNanoRouteMode -quiet -routeSelectedNetOnly false
               setNanoRouteMode -quiet -drouteStartIteration default
               setNanoRouteMode -quiet -envNumberProcessor 1
               setNanoRouteMode -quiet -drouteEndIteration default
               globalDetailRoute
             }
    "wroute" {
               ##-- WROUTE
             wroute
             }
    "wroute2" {
               ##-- WROUTE
             wroute -multiCpu 2
             }
     }
}

proc amsSave postfix {
   global topcellname
   global dbdir
   set filename [format "%s/%s_%s.enc" $dbdir $topcellname $postfix]
   saveDesign $filename
}

proc amsWrite postfix {
   global topcellname
   ##-- Save Design
   amsSave $postfix
   ##-- Write GDS2
   set filename [format "%s_%s_fe.gds" $topcellname $postfix]
   streamOut $filename -mapFile gds2.map -libName DesignLib -structureName $topcellname \
         -attachInstanceName -attachNetName -stripes 1 -units 1000 -mode ALL

   ##-- Verilog Netlist
   set filename [format "%s_%s.v" $topcellname $postfix]
   saveNetlist $filename

   ##-- Extract detail parasitics
   set filename [format "SDF/%s_%s.rcdb" $topcellname $postfix]
# for SOC version < 7.1
#   setExtractRCMode -detail -rcdb $filename -relative_c_t 0.01 -total_c_t 5.0 -reduce 5 -noise
   setExtractRCMode -engine detail -rcdb $filename 
   setXCapThresholds -totalCThreshold 5.0 -relativeCThreshold 0.01
   extractRC
   set filename [format "SDF/%s_%s.spef" $topcellname $postfix]
   rcOut -spef $filename
   
   ##-- run QX extraction
   runQRC -lefFileList {} -layerMapping {} -grayData obs
   set filename [format "SDF/%s_%s_qrc.spef" $topcellname $postfix]
   rcOut -spef $filename

}


proc amsWriteSDF {} {
   global topcellname
   ##-- Parasitic Extraction
   #runQX

   ##-- typical SDF
   amsOpCond typ
   set filename_t [format "SDF/%s_typ.sdf" $topcellname]
   #delayCal -sdf $filename_t
   write_sdf -version 2.1 -prec 3 -edges check_edge -average_typ_delays  \
      -remashold -splitrecrem -splitsetuphold -force_calculation \
      $filename_t

   ##-- best case SDF
   amsOpCond min
   setAnalysisMode -checkType hold
   set filename_b [format "SDF/%s_best.sdf" $topcellname]
   #delayCal -sdf $filename_b
   write_sdf -early -version 2.1 -prec 3 -edges check_edge -average_typ_delays  \
      -remashold -splitrecrem -splitsetuphold -force_calculation \
      $filename_b

   ##-- worst case SDF
   amsOpCond max
   setAnalysisMode -checkType setup
   set filename_w [format "SDF/%s_worst.sdf" $topcellname]
   #delayCal -sdf $filename_w
   write_sdf -late -version 2.1 -prec 3 -edges check_edge -average_typ_delays  \
      -remashold -splitrecrem -splitsetuphold -force_calculation \
      $filename_w

   ##-- Combine all SDFs
   set filename [format "SDF/%s_all.sdf" $topcellname]
   sdfCombine -file $filename_b $filename_t $filename_w -output $filename
   print "### Combined SDF File for best/typ/worst written!!"
}

##--  write SDF for a specific analysis view
proc amsWriteSDF4View {viewList} {
   global topcellname

   foreach view $viewList {
      set filename [format "SDF/%s_%s.sdf" $topcellname $view]
      print "---# Analysis View: $view\n"

      write_sdf -version 2.1 -prec 3 -edges check_edge -average_typ_delays \
       -remashold -splitrecrem -splitsetuphold -force_calculation \
       -view $view $filename
      print "---# Created SDF: $filename\n"
   }
}

##-- Other usefule procedures

proc amsZoomTo {x y {factor 10}} {
   set llx [expr {$x - $factor}]
   set lly [expr {$y - $factor}]
   set urx [expr {$x + $factor}]
   set ury [expr {$y + $factor}]
   zoomBox $llx $lly $urx $ury
}
##-- End of First Encounter TCL command file

proc protoSDF {} {
    amsDbSetup
    floorplan -r 1.0 0.8 2 2 2 2
    setPlaceMode -fp true -timingDriven false -reorderScan false -doCongOpt false -modulePlan false
    placeDesign -noPrePlaceOpt
    trialRoute -maxRouteLayer 4 -floorplanMode
    extractRC
    amsWriteSDF
}

