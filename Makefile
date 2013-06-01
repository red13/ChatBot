DST_DIR=../web/trunk/sandbox

FILES=ChatBot.cgi \
	ChatBot/Model.pm \
	ChatBot/Control.pm

all:
	cp -i $(FILES) $(DST_DIR)/

