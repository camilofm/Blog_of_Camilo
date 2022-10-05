#!/bin/bash

### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
###                                                             ###
###   This script creates configure files for PMF calculation   ###
###        Run this script before 02-create_us_eq-cfm.sh        ###
###       Needs the following things in the same directory:     ###
###               negative_rc.txt, traj_frames_*.txt,           ###
###                conf_template.inp, makenew_*inp,             ###
###                        positive_rc.txt                      ###
###        (Remember to address the .crd, .psf, .dcd &          ###
###         parameters files in the conf_template file)         ###
###   Note: There is a part (mentioned below) that must be      ###
###         adapted to the number of RC & trajectory frames     ###
###         of your system.                                     ###
###   by CFM                                                    ###

### First part: negative RC ###  

#creating negative RC directories & conf_nX.inp files within
cat negative_rc.txt | while read rc
do
   mkdir n$rc
   echo "n$rc directory created ..."
   sed -e "s|RRR|n$rc|g" conf_template.inp > n$rc/conf_n$rc.inp # changes input & output
   echo "n$rc/conf_n$rc.inp file created ..."
done

#generating a temporary file 'rc_tr-neg.txt' to use each number later
cat negative_rc.txt >> rc_tr-neg.txt
cat traj_frames_neg.txt >> rc_tr-neg.txt
echo "rc_tr-neg.txt temporary file created ..."

#!!! This part must be adapted to the number of RC & trajectory frames of your system !!!#
#reading RC
read rc1 < <(sed -n 1p rc_tr-neg.txt)
read rc2 < <(sed -n 2p rc_tr-neg.txt)
read rc3 < <(sed -n 3p rc_tr-neg.txt)
read rc4 < <(sed -n 4p rc_tr-neg.txt)
read rc5 < <(sed -n 5p rc_tr-neg.txt)
read rc6 < <(sed -n 6p rc_tr-neg.txt)
read rc7 < <(sed -n 7p rc_tr-neg.txt)
read rc8 < <(sed -n 8p rc_tr-neg.txt)

#reading trajectory frames
read fr1 < <(sed -n 9p rc_tr-neg.txt)
read fr2 < <(sed -n 10p rc_tr-neg.txt)
read fr3 < <(sed -n 11p rc_tr-neg.txt)
read fr4 < <(sed -n 12p rc_tr-neg.txt)
read fr5 < <(sed -n 13p rc_tr-neg.txt)
read fr6 < <(sed -n 14p rc_tr-neg.txt)
read fr7 < <(sed -n 15p rc_tr-neg.txt)
read fr8 < <(sed -n 16p rc_tr-neg.txt)

#correlating each frame of trajectory with its appropriate RC conf file
sed -i "s|TTT|$fr1|g" n$rc1/conf_n$rc1.inp
echo "n$rc1/conf_n$rc1.inp file correctly correlated ..."
sed -i "s|TTT|$fr2|g" n$rc2/conf_n$rc2.inp
echo "n$rc2/conf_n$rc2.inp file correctly correlated ..."
sed -i "s|TTT|$fr3|g" n$rc3/conf_n$rc3.inp
echo "n$rc3/conf_n$rc3.inp file correctly correlated ..."
sed -i "s|TTT|$fr4|g" n$rc4/conf_n$rc4.inp
echo "n$rc4/conf_n$rc4.inp file correctly correlated ..."
sed -i "s|TTT|$fr5|g" n$rc5/conf_n$rc5.inp
echo "n$rc5/conf_n$rc5.inp file correctly correlated ..."
sed -i "s|TTT|$fr6|g" n$rc6/conf_n$rc6.inp
echo "n$rc6/conf_n$rc6.inp file correctly correlated ..."
sed -i "s|TTT|$fr7|g" n$rc7/conf_n$rc7.inp
echo "n$rc7/conf_n$rc7.inp file correctly correlated ..."
sed -i "s|TTT|$fr8|g" n$rc8/conf_n$rc8.inp
echo "n$rc8/conf_n$rc8.inp file correctly correlated ..."

rm rc_tr-neg.txt
#!!! !!! !!! !!! !!! !!! !!! !!! !!! !!!  !!! !!! !!! !!! !!! !!! !!! !!! !!! !!! !!! !!!#

#copying some relevant files down to the nRC directories & executing the conf file
cat negative_rc.txt | while read rc
do
   cp makenew_*inp n$rc/
   cp -r toppar* n$rc/ #copying parameters file & directory for the protein
   cp -r 7kp/ n$rc/ #copying parameters directory for the ligand
   echo "Relevant files copied down to n$rc/ directory ..."
   echo "Executing n$rc/conf_n$rc.inp file in charmm..."
   cd n$rc
   /opt/charmm-45b2/exec/gnu_M/charmm < conf_n$rc.inp > conf_n$rc.out
   cd ..
done

###   Second part: positive RC ###

#creating positive RC directories & conf_pX.inp files within
cat positive_rc.txt | while read rc
do
   mkdir p$rc
   echo "p$rc directory created ..."
   sed -e "s|RRR|p$rc|g" conf_template.inp > p$rc/conf_p$rc.inp # changes input & output
   echo "p$rc/conf_p$rc.inp file created ..."
done

#generating a temporary file 'rc_tr-pos.txt' to use each number later
cat positive_rc.txt >> rc_tr-pos.txt
cat traj_frames_pos.txt >> rc_tr-pos.txt
echo "rc_tr-pos.txt temporary file created ..."

#!!! This part must be adapted to the number of RC & trajectory frames of your system !!!#
#reading RC
read rc1 < <(sed -n 1p rc_tr-pos.txt)
read rc2 < <(sed -n 2p rc_tr-pos.txt)
read rc3 < <(sed -n 3p rc_tr-pos.txt)
read rc4 < <(sed -n 4p rc_tr-pos.txt)
read rc5 < <(sed -n 5p rc_tr-pos.txt)
read rc6 < <(sed -n 6p rc_tr-pos.txt)
read rc7 < <(sed -n 7p rc_tr-pos.txt)
read rc8 < <(sed -n 8p rc_tr-pos.txt)

#reading trajectory frames
read fr1 < <(sed -n 9p rc_tr-pos.txt)
read fr2 < <(sed -n 10p rc_tr-pos.txt)
read fr3 < <(sed -n 11p rc_tr-pos.txt)
read fr4 < <(sed -n 12p rc_tr-pos.txt)
read fr5 < <(sed -n 13p rc_tr-pos.txt)
read fr6 < <(sed -n 14p rc_tr-pos.txt)
read fr7 < <(sed -n 15p rc_tr-pos.txt)
read fr8 < <(sed -n 16p rc_tr-pos.txt)

#correlating each frame of trajectory with its appropriate RC conf file
sed -i "s|TTT|$fr1|g" p$rc1/conf_p$rc1.inp
echo "p$rc1/conf_p$rc1.inp file correctly correlated ..."
sed -i "s|TTT|$fr2|g" p$rc2/conf_p$rc2.inp
echo "p$rc2/conf_p$rc2.inp file correctly correlated ..."
sed -i "s|TTT|$fr3|g" p$rc3/conf_p$rc3.inp
echo "p$rc3/conf_p$rc3.inp file correctly correlated ..."
sed -i "s|TTT|$fr4|g" p$rc4/conf_p$rc4.inp
echo "p$rc4/conf_p$rc4.inp file correctly correlated ..."
sed -i "s|TTT|$fr5|g" p$rc5/conf_p$rc5.inp
echo "p$rc5/conf_p$rc5.inp file correctly correlated ..."
sed -i "s|TTT|$fr6|g" p$rc6/conf_p$rc6.inp
echo "p$rc6/conf_p$rc6.inp file correctly correlated ..."
sed -i "s|TTT|$fr7|g" p$rc7/conf_p$rc7.inp
echo "p$rc7/conf_p$rc7.inp file correctly correlated ..."
sed -i "s|TTT|$fr8|g" p$rc8/conf_p$rc8.inp
echo "p$rc8/conf_p$rc8.inp file correctly correlated ..."

rm rc_tr-pos.txt
#!!! !!! !!! !!! !!! !!! !!! !!! !!! !!!  !!! !!! !!! !!! !!! !!! !!! !!! !!! !!! !!! !!!#

#copying some relevant files down to the pRC directories & executing the conf file
cat positive_rc.txt | while read rc
do
   cp makenew_*inp p$rc/
   cp -r toppar* p$rc/ #copying parameters file & directory for the protein
   cp -r 7kp/ p$rc/ #copying parameters directory for the ligand
   echo "Relevant files copied down to p$rc/ directory ..."
   echo "Executing p$rc/conf_p$rc.inp file in charmm..."
   cd p$rc
   /opt/charmm-45b2/exec/gnu_M/charmm < conf_p$rc.inp > conf_p$rc.out
   cd ..
done

echo "Done."

###                                                             ###
###                       End of this script                    ###
###                                                             ###
### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
