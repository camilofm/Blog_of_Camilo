#!/bin/bash

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
###                                                             ###
###  This script creates equilibration files for US - QM/MM MD  ###
###             Run this after 01-create_conf-cfm.sh            ###
###            Additionally needs the following files           ###
###                      in the same directory:                 ###
###                 us_eq_template.inp, sccdftb.dat             ###
###          (Remember to define your qm zone, charge &         ###
###         other parameters in the us_eq_template file)        ###
###   by CFM                                                    ###

### First part: negative RC ###  

#creating the eq_nX.inp file & copying sccdftb.dat file
cat negative_rc.txt | while read rc
do
   d1=`echo $rc | cut -b 1`
   d2=`echo $rc | cut -b 2`
   sed -e "s|TTT|-$d1.$d2|g" us_eq_template.inp > n$rc/eq_n$rc.inp   #putting the RC
   sed -i "s|RRR|n$rc|g" n$rc/eq_n$rc.inp   #changing the input & output
   echo "n$rc/eq_n$rc.inp file created ..."
   cp sccdftb.dat n$rc
done

### Second part: positive RC ###

#creating the eq_pX.inp file & copying sccdftb.dat file
cat positive_rc.txt | while read rc
do
   d1=`echo $rc | cut -b 1`
   d2=`echo $rc | cut -b 2`
   sed -e "s|TTT|$d1.$d2|g" us_eq_template.inp > p$rc/eq_p$rc.inp   #putting the RC
   sed -i "s|RRR|p$rc|g" p$rc/eq_p$rc.inp   #changing the input & output
   echo "p$rc/eq_p$rc.inp file created ..."
   cp sccdftb.dat p$rc
done

echo "Done."

###                                                             ###
###                       End of this script                    ###
###                                                             ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
