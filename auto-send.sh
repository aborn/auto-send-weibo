#!/bin/bash
###################################################################
# NAME
#     auto-send.sh automatically send microblog(weibo) in linux
# USAGE
#     ./auto-send.sh [-f|-c  |"content"] [ -p /path/to/pic.png]
# OPTIONS
#     -h       this help manual.
#     -f       send file './weibo/weibo.cont' content
#     -c       [contents], short content text information
#     -p       image path default:./images/weibo.png
# EXAMPLE
#      ./auto-send.sh -c "My first test microblog" 
#      ./auto-send.sh -f 
#      ./auto-send.sh -p ./images/pi.png -f
# NOTE
#      This version only support single picture
# AUTHOR
#      Aborn Jiang (loveaborn@foxmail.com)
# VERSION
#      v0.1  2013-10-02
###################################################################

source help_info.sh
ABSPATH=$(cd $(dirname $0); pwd);
CFGFILE="account.cfg.aborn"
updateURL="https://api.weibo.com/2/statuses/update.json"
uploadURL="https://upload.api.weibo.com/2/statuses/upload.json"

[ $# -eq 0 ] && help_info && exit 1
while getopts hfc:p:l: opt
do
	case "$opt" in
		h) help_info ;exit 0;;                    # this help_info function in ./scripts/functions.sh
		f) TXTTYPE="file";;
		c) TXTTYPE="txtmsg"; CONTENT=${OPTARG};;
		p) IMGTAG="true";IMGPATH=${OPTARG};;
		l) IMGLIST=${OPTARG};;
		*) echo "Unknown option:$opt";help_info;exit 1;; 
	esac
done

[ -z ${CONTFILE} ] && CONTFILE="${ABSPATH}/weibo/weibo.cont"
[ -z ${IMGPATH} ]  && IMGPATH="${ABSPATH}/images/weibo.png"
[ -z ${IMGLIST} ]  && IMGLIST="images.list"


function configure()
{
	if [ -f ${CFGFILE} ];then
		chmod 600 ${CFGFILE}
		source ${CFGFILE}
	else
		echo "no configure ${CFGFILE}."
		exit 1
	fi
}

function deal-text-cont()
{
	if [ ! -z ${TXTTYPE} ];then
		[ ${TXTTYPE} == "file" ] && CONTENT=$(cat ${CONTFILE})
	fi
}

function deal-with-image()
{
	IMGPATH=$1
	IMGLISTCONT=""
	[ ! -s ${IMGLIST} ] && echo "image list doesn't exist!" && exit 1
	lists=$(cat ${IMGLIST} |egrep -v "^#")
	for iterm in ${lists}
	do
		IMGLISTCONT=" ${IMGLISTCONT} -F \"pic=@./images/${iterm}\" "
	done
	#echo ${IMGLISTCONT}
	#IMGCONT=" \"pic=@${IMGPATH}\"  "

	len=$(echo ${CONTENT} |wc -w)
	if  [ ${len} -eq 0 ];then
		CONTENT="See this picture. 见图."
	fi
}

function send-text-only()
{
	length=$(echo ${CONTENT} |wc -w)
	if [ ${length} -ne 0 ];then 
		echo "send microblog only text"
		curl -u ${USER}:${PASSWORD} -d "source=${APPKEY}" -d "status=$(echo ${CONTENT})" ${updateURL} > /dev/null
	else
		echo "no more content to send!"
	fi
}

function send-text-pic()
{
	if [ -f ${IMGPATH} ];then 
		deal-with-image ${IMGPATH}
		curl -u ${USER}:${PASSWORD} -F "source=${APPKEY}" -F "status=$(echo ${CONTENT})"  -F "pic=@${IMGPATH}" ${uploadURL} > /dev/null
		echo "send microblog with picture"
	else
		echo "the image: ${IMGPATH} doesn't exist! Send text only."
		send-text-only
	fi
}

function main()
{
	configure
	deal-text-cont
	if [ ! -z ${IMGTAG} ];then
		send-text-pic
	else
		send-text-only
	fi
	exit 0
}

main
