#!/bin/bash
##################################
# auto send weibo in console
##################################

ABSPATH=$(cd $(dirname $0); pwd);
#echo "Working dir:${ABSPATH}"
CFGFILE="account.cfg"
CONTFILE="${ABSPATH}/weibo/weibo.cont"
updateURL="https://api.weibo.com/2/statuses/update.json"

if [ -f ${CFGFILE} ];then
	chmod 600 ${CFGFILE}
	source ${CFGFILE}
else
	echo "no configure ${CFGFILE}."
	exit 1
fi

if [ -s ${CONTFILE} ];then
	curl -u ${USER}:${PASSWORD} -d "source=${APPKEY}" -d "status=$(cat ${CONTFILE})" ${updateURL} > /dev/null
else
	echo "no more content to send!"
fi
