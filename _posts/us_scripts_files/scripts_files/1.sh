#!/bin/bash

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
read rc1 < <(sed -n 1p rc_tr-pos.txt)
read rc2 < <(sed -n 2p rc_tr-pos.txt)
read rc3 < <(sed -n 3p rc_tr-pos.txt)
read fr1 < <(sed -n 4p rc_tr-pos.txt)
read fr2 < <(sed -n 5p rc_tr-pos.txt)
read fr3 < <(sed -n 6p rc_tr-pos.txt)

#correlating each frame of trajectory with its appropriate RC conf file
sed -i "s|TTT|$fr1|g" p$rc1/conf_p$rc1.inp
echo "p$rc1/conf_p$rc1.inp file correctly correlated ..."
sed -i "s|TTT|$fr2|g" p$rc2/conf_p$rc2.inp
echo "p$rc2/conf_p$rc2.inp file correctly correlated ..."
sed -i "s|TTT|$fr3|g" p$rc3/conf_p$rc3.inp
echo "p$rc3/conf_p$rc3.inp file correctly correlated ..."

rm rc_tr-pos.txt
#!!! !!! !!! !!! !!! !!! !!! !!! !!! !!!  !!! !!! !!! !!! !!! !!! !!! !!! !!! !!! !!! !!!#

#copying some relevant files down to the nRC directories & executing the conf file
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

