auto-send-weibo
===============

## INTRODUCTION
This project is written by Shell scripts, which is used to
automatically send weibo in Linux platform including Ubuntu, Raspberry
Pi etc.

## NOTE
#### Before you use this code, please confirm:
* You must have an weibo account. 
* Please sign up from www.weibo.com if you don't have an account.

#### In this README.md, ${ABSPATH} means this file path

#### This project use shell(bash) scripts.
* Get help message by run $./auto-send.sh -h

## USAGE
1. Apply an application and get App Key(APPKEY) in open.weibo.com
2. Modify file ./conf/account.cfg depend on your weibo account (USER,
   PASSWORD and APPKEY)
3. Edit weibo content in file ${ABSPATH}/weibo/weibo.cont
4. All pictures/images are stored in ${ABSPATH}/images/
5. Running: 

> $ ./auto-send.sh -f                # send a blog without image  
> $ ./auto-send.sh -p images/pi.png  # with image  
> $ ./auto-send.sh -f -p images/pi.png   

## EXAMPLE
	./auto-send.sh -h                 # help manual  
    ./auto-send.sh -c "My first test microblog"  
    ./auto-send.sh -f                 # send file "./weibo/weibo.cont"
	content  
    ./auto-send.sh -p ./images/pi.png -f  

## REMINDER
This version only support single picture

## AUTHOR
    Aborn Jiang (aborn.jiang@foxmail.com)

## VERSION
* V0.01  2013-10-02
* v0.1   2013-10-02
* v0.1.1 2014-03-23
