#!/bin/bash
#
# crt.sh sub-domain check by 1N3@CrowdShield
# https://crowdshield.com 
#

OKBLUE='\033[94m'
OKRED='\033[91m'
OKGREEN='\033[92m'
OKORANGE='\033[93m'
RESET='\e[0m'
TARGET="$1"
PARA="$2"
FILESAVE=false


displayLogo(){
	echo -e "$OKRED            _         _     $RESET"
	echo -e "$OKRED   ___ _ __| |_   ___| |__  $RESET"
	echo -e "$OKRED  / __| '__| __| / __| '_ \ $RESET"
	echo -e "$OKRED | (__| |  | |_ _\__ \ | | |$RESET"
	echo -e "$OKRED  \___|_|   \__(_)___/_| |_|$RESET"
}

startOfProgram(){
	displayLogo
  	echo ""
	echo -e "$OKRED [+] by 1N3@CrowdShield$RESET"
	echo -e "$OKRED [+] https://crowdshield.com$RESET"
	echo -e "$OKRED [-] Usage: crt.sh <target>$RESET"
	echo -e "$OKRED [-] Usage: crt.sh <target> [parameters]$RESET"
	echo -e "$OKRED [parameters] => -f : to save to file$RESET"
}

validateURL(){
	URL=$TARGET
	if [[ $URL =~ ^https:// ]]; then
		echo -e "$OKRED RL should not contain 'https://' prefix."
		return 1
	fi

	if [[ $URL =~ ^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
		return 0
	else
		echo -e "$OKRED Invalid Target: $URL"
		return 1
	fi
}

validateParameter(){
	if [[ $PARA = "-f" ]]; then
		FILESAVE=true
	fi
}

workAccParameter(){
	if [ "$FILESAVE" = true ]; then
		cat /tmp/curl.out | grep $TARGET | grep TD | sed -e 's/<//g' | sed -e 's/>//g' | sed -e 's/TD//g' | sed -e 's/\///g' | sed -e 's/ //g' | sed -n '1!p' | sort -u > $TARGET-crt.txt
		cat $TARGET-crt.txt
		echo -e "$OKRED [+] Domains saved to: $TARGET-crt.txt"
	else
		cat /tmp/curl.out | grep $TARGET | grep TD | sed -e 's/<//g' | sed -e 's/>//g' | sed -e 's/TD//g' | sed -e 's/\///g' | sed -e 's/ //g' | sed -n '1!p' | sort -u
	fi
}

if [ -z $TARGET ]; then
	startOfProgram
	exit
elif [ $TARGET = "-f" ]; then
	startOfProgram
	exit
elif [[ $TARGET = "--help" ]]; then
	startOfProgram
	exit
fi
validateParameter
validateURL
if [ $? -eq 0 ]; then
	displayLogo
	echo ""
	echo -e "$OKRED [+] by 1N3@CrowdShield$RESET"
	echo -e "$OKRED [+] https://crowdshield.com$RESET"
	echo -e "$OKRED + -- ----------------------------=[Gathering Certificate Subdomains]=-------- -- +$RESET"
	curl -s https://crt.sh/?q=%25.$TARGET > /tmp/curl.out
	workAccParameter
	echo -e "$OKRED + -- ----------------------------=[Done!]=----------------------------------- -- +$RESET"
else
	startOfProgram
	exit
fi