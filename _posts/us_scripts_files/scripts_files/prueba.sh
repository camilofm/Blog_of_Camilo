#!/bin/bash

cat negative_rc.txt | while read rc
do
   mkdir n$rc
   sed -e "s|RRR|n$rc|g" conf_template.inp > n$rc/conf_n$rc.inp
done

cat negative_rc.txt >> rc_tr-neg.txt
cat traj_frames_neg.txt >> rc_tr-neg.txt

read rc1 < <(sed -n 1p rc_tr-neg.txt)
read rc2 < <(sed -n 2p rc_tr-neg.txt)
read rc3 < <(sed -n 3p rc_tr-neg.txt)
read fr1 < <(sed -n 4p rc_tr-neg.txt)
read fr2 < <(sed -n 5p rc_tr-neg.txt)
read fr3 < <(sed -n 6p rc_tr-neg.txt)

sed -i "s|TTT|$fr1|g" n$rc1/conf_n$rc1.inp
sed -i "s|TTT|$fr2|g" n$rc2/conf_n$rc2.inp
sed -i "s|TTT|$fr3|g" n$rc3/conf_n$rc3.inp
#sed -i "s|TTT|$fr1|g" n$rc1/conf_n$rc1.inp
#sed -i "s|TTT|$fr1|g" n$rc1/conf_n$rc1.inp
#sed -i "s|TTT|$fr1|g" n$rc1/conf_n$rc1.inp

rm rc_tr-neg.txt



#while read rc < <(sed -n 1p prueba.txt)
#do
#   echo $rc   
   #mkdir $rc
#done

#   sed -e "s|TTT|$fr|g" conf_template.inp > conf_$fr.inp   #changes ifile
#done

#read var1 var2 < <(sed -n 1p neg_rc-traj.txt)
#read var3 var4 < <(sed -n 2p neg_rc-traj.txt)




#read -a words
#echo "${words[@]}"

#while read -r line
#do
#   for word in $line
#   do
#      echo "$word"
#   done
#done <"neg_rc-traj.txt"

#for var1 in `cat neg_rc-traj.txt`
#do
#   echo $var1
#done

#file="neg_rc-traj.txt"
#read -d " " var1 var2 <$file
#echo "$var1 $var2"

#while read var1
#do
# echo -e "$var1"
#done
#cat neg_rc-traj.txt | read var1 #var2 var3
#do
#   echo $var1 #$var2 $var3
#done

#for rc in 14 13 11
#do
#   mkdir n$
#   sed -e "s|RRR|n$rc|g" conf_template.inp > n$rc/conf_n$rc.inp
#   cat traj_frames_neg.txt | read fr
#   for fr in 18 16 15 
#   do
#      sed -i "s|TTT|$fr|g" n$rc/conf_n$rc.inp
#   done   
#done

#cat traj_frames_neg.txt | while read fr
#do
#   sed -e "s|TTT|$fr|g" conf_template.inp > conf_$fr.inp   #changes ifile
#done

#cat negative_rc.txt | while read rc
#do
#   sed -i "s|RRR|n$rc|g" n$rc/conf_n$rc.inp   #overwrites file & changes input & output
#done


