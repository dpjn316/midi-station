#!/bin/bash 

MIDI_INTERFACE="E-MU XMidi2X2"
CONNECTED=""
MSG=""
LOG="/var/log/auto_connect_midi_interface.log"
while true;do
	DATE=$(date +'%Y-%m-%d %H:%M:%S %:z')
	E_MU_ID=$(aconnect -l | grep -P "client \d+: '${MIDI_INTERFACE}'" -o | grep -P "(\d+):" -o) 
	if [[ -z "$E_MU_ID" ]]
	then 
		MSG="WARNING: Interfaz no contectada"
		#echo $MSG
		(echo "${DATE} ${MSG}") 2>&1 | tee -a $LOG
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
			MSG2=$(aconnect -l | grep -P "client \d+: '${MIDI_INTERFACE}'" -o)
			if [[ "$MSG" != "$MSG2" ]]	
			then
				MSG=$MSG2
				(echo "${DATE} ${MSG}") 2>&1 | tee -a $LOG
			fi
		else
			MSG3="Interfaz conectada!"
			if [[ "$MSG" != "$MSG3" ]]	
			then
				MSG=$MSG3
				(echo "${DATE} ${MSG}") 2>&1 | tee -a $LOG
			fi
			sleep 5
		fi
	fi
done

