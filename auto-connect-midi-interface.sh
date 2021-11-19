#!/bin/bash 

INTERFACE="E-MU XMidi2X2"
CONNECTED=""
MSG=""
while true;do
	E_MU_ID=$(aconnect -l | grep -P "client \d+: '${INTERFACE}'" -o | grep -P "(\d+):" -o) 
	if [[ -z "$E_MU_ID" ]]
	then 
		MSG="WARNING: Interfaz no contectada"
		echo $MSG
		sleep 5
	else
		CONNECTED=$(aconnect -l | grep "Connected From: ${E_MU_ID}0, ${E_MU_ID}1")
		if [ -z "$CONNECTED" ]
		then
			aconnect -x
			CONTROLLER1="${E_MU_ID}0 ${E_MU_ID}1"
			CONTROLLER2="${E_MU_ID}1 ${E_MU_ID}1"

			aconnect $CONTROLLER1
			aconnect $CONTROLLER2
		
			CONNECTED=$(aconnect -l | grep "Connected From: ${E_MU_ID}0, ${E_MU_ID}1")
			MSG2=$(aconnect -l | grep -P "client \d+: '${INTERFACE}'" -o)
			if [[ "$MSG" != "$MSG2" ]]	
			then
				MSG=$MSG2
				echo $MSG
			fi
		else
			MSG3="Interfaz conectada!"
			if [[ "$MSG" != "$MSG3" ]]	
			then
				MSG=$MSG3
				echo $MSG
			fi
			sleep 5
		fi
	fi
done

