#!/bin/bash
#Import Settings
source config.cfg

#Get current status of the monitoring programm in a boolean / checks if its running or not
IS_RUNNING=$(ps -ef | grep "createBackup.sh" | grep -v grep | wc -l | xargs)

#Check if screen backup screen exists
if screen -list | grep -q "$SCREEN_NAME"; then
	#Screen already exists
	if [ "$IS_RUNNING" -eq "1" ]; then
		#Backup already running
                echo "${C_RED}Backup already running${C_RESET}"
                exit 1
	else
		#Backup isnt running
                echo "${C_GREEN}Backup is starting${C_RESET}"
                echo "${C_YELLOW}Backup of ${VM_COUNT}/${VM_TOTAL_COUNT} virtual machines in total!${C_RESET}"
                screen -S $SCREEN_NAME -p 0 -X stuff "bash ${PROJECT_PATH}/createBackup.sh^M"
	fi
else
	#Screen doesnt exists
	screen -dmS $SCREEN_NAME
	if [ "$IS_RUNNING" -eq "1" ]; then
		#Backup already running
                echo "${C_RED}Backup already running${C_RESET}"
                exit 1
	else
		#Backup isnt running
                echo "${C_GREEN}Backup is starting${C_RESET}"
                echo "${C_YELLOW}Backup of ${VM_COUNT}/${VM_TOTAL_COUNT} virtual machines in total!${C_RESET}"
                screen -S $SCREEN_NAME -p 0 -X stuff "bash ${PROJECT_PATH}/createBackup.sh^M"
	fi
fi