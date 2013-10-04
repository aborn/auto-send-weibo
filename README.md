auto-send-weibo
===============

## INTRODUCTION

This project is written by Shell scripts, which used to automatically send weibo in Linux 
platform including Ubuntu, Raspberry Pi etc.

## NOTE
#### Before you use this code, please confirm:
* You must have an weibo account. 
* Please sign up from www.weibo.com if you don't have an account.

#### In this README.md, ${ABSPATH} means this file path

#### This project use shell(bash) scripts.
* Get help message by run $./auto-send.sh -h

## USAGE
1. Edit file account.cfg to configure your account (USER and PASSWORD)
2. Apply an application and get App Key in open.weibo.com
3. Edit weibo content in file ${ABSPATH}/weibo/weibo.cont
4. All pictures/images are stored in ${ABSPATH}/images/
5. Running: 

> $ ./auto-send.sh -f                # send a blog without image

> $ ./auto-send.sh -p images/pi.png  # with image

> $ ./auto-send.sh -f -p images/pi.png 

## EXAMPLE
	./auto-send.sh -h    # get help msg
    ./auto-send.sh -c "My first test microblog"
    ./auto-send.sh -f 
    ./auto-send.sh -p ./images/pi.png -f


## AUTHOR
    Aborn Jiang (loveaborn@foxmail.com)

## VERSION
    V0.01  2013-10-02
    v0.1   2013-10-02
