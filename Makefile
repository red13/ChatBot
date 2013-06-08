DST_DIR=../web/trunk/sandbox

FILES=ChatBot.cgi \
	ChatBot/Model.pm \
	ChatBot/Control.pm

test:
	ruby server-test.rb

all:
	cp -i $(FILES) $(DST_DIR)/
