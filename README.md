auto-send-weibo
===============

## INTRODUCTION

This project is used to automatically send weibo in Linux 
platform, which includes Ubuntu, Raspberry Pi etc.

## NOTE
#### Before you use this code, please confirm:
* You must have an weibo account. Please apple it form www.weibo.com if you don't.

#### In this README.md, ${ABSPATH} means this file path

#### This project use shell(bash) scripts.

## USAGE
1. Edit file account.cfg to configure your account infomation
2. Edit weibo content in file ${ABSPATH}/weibo/weibo.cont
3. All pictures/images are stored in ${ABSPATH}/images/
4. Edit picture list in images.list
5. Running: ${ABSPATH}/auto-send.sh or ./auto-send.sh

## EXAMPLE
	./auto-send.sh -h    # get help msg
    ./auto-send.sh -c  "My first test microblog"
    ./auto-send.sh -f 
    ./auto-send.sh -p ./images/pi.png -f


## AUTHOR
    Aborn Jiang (loveaborn@foxmail.com)

## VERSION
    V0.01  2013-10-02
    v0.1   2013-10-02
