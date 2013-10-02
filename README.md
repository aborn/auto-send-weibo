auto-send-weibo
===============

# INTRODUCTION
	This project is used to automatically send weibo in Linux platform, which includes Ubuntu, Raspberry Pi etc.
# NOTE
### Before you use this code, please confirm:
1. You must have an weibo account. Please apple it form www.weibo.com if you don't.
2. You should create an application in open.weibo.com and get the App Key

### In this README.md, ${ABSPATH} means this file path

### This project use shell(bash) scripts.

# USAGE
1. Edit file account.cfg to configure your account infomation
2. Edit weibo content in file ${ABSPATH}/weibo/weibo.cont
3. All pictures/images are stored in ${ABSPATH}/weibo/
4. Edit picture list in image.list
5. Running: ${ABSPATH}/auto-send.sh or ./auto-send.sh

# EXAMPLE
	./auto-send.sh

# AUTHOR
    Aborn Jiang (loveaborn@foxmail.com)

# VERSION
    V0.01  2013-10-02
