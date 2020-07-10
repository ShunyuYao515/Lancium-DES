#!/bin/bash
CSID_X=905
CSID_Y=490
STI_X=965
STI_Y=490
SID_X=1025
SID_Y=505
CS_X=1090
CS_Y=490
SFP_X=1140
SFP_Y=465
DISCARD_X=1175
DISCARD_Y=505
R2V1_X=860
R2V1_Y=465
R6V1_X=995
R6V1_Y=490

CF_X=1125
CF_Y=455
ACC_X=1287
ACC_Y=177
CZQ_X=1282
CZQ_Y=232
OP_X=1372
OP_Y=267
QRY_X=1302
QRY_Y=297
CZQ2_X=1217
CZQ2_Y=442
CCR_X=1257
CCR_Y=502
COMP_X=1452
COMP_Y=492
LTCL_X=1512
LTCL_Y=457
TD_X=1703
TD_Y=378
CCR2_X=1628
CCR2_Y=378
AS2_X=1457
AS2_Y=375
TD3_X=1802
TD3_Y=457
CTR_X=1792
CTR_Y=512
STI3_X=1327
STI3_Y=502
STI4_X=1382
STI4_Y=482
STI5_X=1852
STI5_Y=512
CZ_X=1512
CZ_Y=365
STI6_X=1568
STI6_Y=378
DIS2_X=1382
DIS2_Y=347
DIS3_X=1867
DIS3_Y=457
DIS4_X=1552
DIS4_Y=507
QUE_X=1607
QUE_Y=467
R36V1_X=1247
R36V1_Y=372
R39V1_X=1177
R39V1_Y=457
R38V1_X=1412
R38V1_Y=392
R46V1_X=1752
R46V1_Y=447
R44V1_X=1537
R44V1_Y=380
R51V1_X=1552
R51V1_Y=467

NODE_TEMPLATE=$(cat node_template.xml)
tr '\n' '\' < node_template.xml > node_templateT.xml
sed -i "s/\\\/\\\n/g" node_templateT.xml
sed -i "s/\"/\\\\\"/g" node_templateT.xml
sed -i "s/\&/\\\\\&/g" node_templateT.xml

SUBCLUSTER_COUNT=$(wc -l configT| awk '{print $1}') 
for (( c=1; c<=${SUBCLUSTER_COUNT}; c++ ))
do
	if [[ $c -eq 1 ]]
	then
		sed "s+SUBCLUSTER_REPLACEMENT+$(cat node_templateT.xml)\nSUBCLUSTER_REPLACEMENT+g" model_template.xml > Lancium_model.xml
	else
		sed -i "s|SUBCLUSTER_REPLACEMENT|$(cat node_templateT.xml)\nSUBCLUSTER_REPLACEMENT|g" Lancium_model.xml
	fi
	sed -i "s|SUBCLUSTER_ID|${c}|g" Lancium_model.xml

	sed -i "s|CS_X|${CS_X}|g" Lancium_model.xml
	sed -i "s|STI_X|${STI_X}|g" Lancium_model.xml
	sed -i "s|CSID_X|${CSID_X}|g" Lancium_model.xml
	sed -i "s|SID_X|${SID_X}|g" Lancium_model.xml
	sed -i "s|SFP_X|${SFP_X}|g" Lancium_model.xml
	sed -i "s|DISCARD_X|${DISCARD_X}|g" Lancium_model.xml

	sed -i "s|CF_X|${CF_X}|g" Lancium_model.xml
	sed -i "s|ACC_X|${ACC_X}|g" Lancium_model.xml
	sed -i "s|CZQ_X|${CZQ_X}|g" Lancium_model.xml
	sed -i "s|OP_X|${OP_X}|g" Lancium_model.xml
	sed -i "s|QRY_X|${QRY_X}|g" Lancium_model.xml
	sed -i "s|CZQ2_X|${CZQ2_X}|g" Lancium_model.xml
	sed -i "s|CCR_X|${CCR_X}|g" Lancium_model.xml
	sed -i "s|COMP_X|${COMP_X}|g" Lancium_model.xml
	sed -i "s|LTCL_X|${LTCL_X}|g" Lancium_model.xml
	sed -i "s|TD_X|${TD_X}|g" Lancium_model.xml
	sed -i "s|CCR2_X|${CCR2_X}|g" Lancium_model.xml
	sed -i "s|AS2_X|${AS2_X}|g" Lancium_model.xml
	sed -i "s|TD3_X|${TD3_X}|g" Lancium_model.xml
	sed -i "s|CTR_X|${CTR_X}|g" Lancium_model.xml
	sed -i "s|STI3_X|${STI3_X}|g" Lancium_model.xml
	sed -i "s|STI4_X|${STI4_X}|g" Lancium_model.xml 
	sed -i "s|STI5_X|${STI5_X}|g" Lancium_model.xml 
	sed -i "s|CZ_X|${CZ_X}|g" Lancium_model.xml 
	sed -i "s|STI6_X|${STI6_X}|g" Lancium_model.xml 
	sed -i "s|DIS2_X|${DIS2_X}|g" Lancium_model.xml 
	sed -i "s|DIS3_X|${DIS3_X}|g" Lancium_model.xml 
	sed -i "s|DIS4_X|${DIS4_X}|g" Lancium_model.xml 
	sed -i "s|QUE_X|${QUE_X}|g" Lancium_model.xml 
	sed -i "s|R36V1_X|${R36V1_X}|g" Lancium_model.xml 
	sed -i "s|R38V1_X|${R38V1_X}|g" Lancium_model.xml 
	sed -i "s|R39V1_X|${R39V1_X}|g" Lancium_model.xml 
	sed -i "s|R44V1_X|${R44V1_X}|g" Lancium_model.xml 
	sed -i "s|R46V1_X|${R46V1_X}|g" Lancium_model.xml 
	sed -i "s|R51V1_X|${R51V1_X}|g" Lancium_model.xml
	sed -i "s|R2V1_X|${R2V1_X}|g" Lancium_model.xml
        sed -i "s|R6V1_X|${R6V1_X}|g" Lancium_model.xml

	sed -i "s|CS_Y|$(expr ${CS_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|CSID_Y|$(expr ${CSID_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|SID_Y|$(expr ${SID_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|SFP_Y|$(expr ${SFP_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|STI_Y|$(expr ${STI_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|DISCARD_Y|$(expr ${DISCARD_Y} - $(expr $c \* 400))|g" Lancium_model.xml

	sed -i "s|CF_Y|$(expr ${CF_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|ACC_Y|$(expr ${ACC_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|CZQ_Y|$(expr ${CZQ_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|OP_Y|$(expr ${OP_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|QRY_Y|$(expr ${QRY_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|CZQ2_Y|$(expr ${CZQ2_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|CCR_Y|$(expr ${CCR_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|COMP_Y|$(expr ${COMP_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|LTCL_Y|$(expr ${LTCL_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|TD_Y|$(expr ${TD_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|CCR2_Y|$(expr ${CCR2_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|AS2_Y|$(expr ${AS2_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|TD3_Y|$(expr ${TD3_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|CTR_Y|$(expr ${CTR_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|STI3_Y|$(expr ${STI3_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|STI4_Y|$(expr ${STI4_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|STI5_Y|$(expr ${STI5_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|CZ_Y|$(expr ${CZ_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|STI6_Y|$(expr ${STI6_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|DIS2_Y|$(expr ${DIS2_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|DIS3_Y|$(expr ${DIS3_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|DIS4_Y|$(expr ${DIS4_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|QUE_Y|$(expr ${QUE_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|R36V1_Y|$(expr ${R36V1_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|R38V1_Y|$(expr ${R38V1_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|R39V1_Y|$(expr ${R39V1_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|R44V1_Y|$(expr ${R44V1_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|R46V1_Y|$(expr ${R46V1_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|R51V1_Y|$(expr ${R51V1_Y} - $(expr $c \* 400))|g" Lancium_model.xml	
        sed -i "s|R2V1_Y|$(expr ${R2V1_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	sed -i "s|R6V1_Y|$(expr ${R6V1_Y} - $(expr $c \* 400))|g" Lancium_model.xml
	
	SUBCLUSTER_CONFIG=$(sed "${c}!d" configT)	
	col_c=1
	for col in $SUBCLUSTER_CONFIG
	do
		case $col_c in
		1)
			echo $col
			;;
		2)
			sed -i "s|SUBCLUSTER_CPU|${col}|g" Lancium_model.xml
			;;
		esac
		col_c=$(expr $col_c + 1)
	done
done
sed -i "s|SUBCLUSTER_REPLACEMENT| |g" Lancium_model.xml
