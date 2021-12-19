#!/bin/bash
# date: 08/07/2021
# dev: Juan Rodenas
# funcion: Notificacion acceso ssh

# requeriments:
TOKEN="YOUR_TOKEN_BOT"
ID="YOUR_TOKEN_CHAT"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"
servidor=$(hostname)
PUBLIC_IP=$(curl http://checkip.amazonaws.com)
SSH=`echo $SSH_CLIENT | awk '{ print $1}'`
IP=`w -h | awk '{print""$3}'`
MESSAGE="\U26A0 ALERTA SSH\U2757 %0A%0A"

if [ "$PAM_TYPE" != "open_session" ]
then
        exit 0
else
        curl -s -X POST $URL -d chat_id=$ID -d text="$(echo -e "$MESSAGE $(date +"%d-%m-%Y %H:%M:%S")\nHost: `hostname`\nUser: $PAM_USER\nHost: $PAM_RHOST\nIP public: $PUBLIC_IP")" > /dev/null 2>&1
        exit 0
fi
