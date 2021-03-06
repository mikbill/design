#!/bin/bash
HOME_DIR=$(cd $(dirname $0)&& pwd)
source $HOME_DIR/radcash.conf
source $HOME_DIR/radcash.lib

FUNC_MAX_UID

if ([ -e "$MAX_UID_FILE" ])
then
MAX_UID_OLD=$(cat $MAX_UID_FILE)

if (( "$MAX_UID_OLD" < "$MAX_UID" ))
then

echo "/tool user-manager user" >$UPLOAD
let "MAX_UID_OLD=MAX_UID_OLD+1"
for (( i=$MAX_UID_OLD; i <= $MAX_UID; i++ ))
do                                                                  
ID=$i                                                               
FUNC_CHECK_ID                                                       
                                                                    
if [ "$CHECK_ID" != "" ]                                            
then                                                                                       

if [ "$RADIUS_HOTSPOT" -ne 0 ]
then
FUNC_HOTSPOT_ID
fi

if [ "$RADIUS_PPP" -ne 0 ]
then
FUNC_PPP_ID
fi
fi

done
SSH_UPLOAD
echo $MAX_UID >$MAX_UID_FILE
fi
else
echo $MAX_UID >$MAX_UID_FILE
fi
