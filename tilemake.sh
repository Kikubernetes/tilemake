#!/bin/bash

#make tiles for images.

mkdir tiles
for i in `seq -f "%03g" 8 2 82`; do
	k=`echo $i | sed 's/0*\([0-9]*[0-9]$\)/\1/g'`
	j=`printf "%03d" $((k*2))`
	convert -geometry 109x109 photo_T1_sag/T1_$j.png photo_T1_sag/sT1_$j.png
	pngappend photo_origb0_sag/b0AP_before_topup_$i.png + \
        photo_origb0PA_sag/b0PA_before_topup_$i.png + \
        photo_T1_sag/sT1_$j.png - \
        photo_after_synb0_sag/b0_u_$i.png + \
        photo_after_synTOPUP_sag/b0AP_after_synTOPUP_$i.png + \
        photo_conT_sag/b0AP_after_convtopup_$i.png tile$i.png 2> /dev/null
done
mv tile*.png tiles/
