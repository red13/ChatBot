#!/usr/bin/perl

use strict;
use warnings;
use CGI ':standard';

use ChatBot::Control;

main();
exit;


# 
sub main
{
	my $yours = param('sentence');
	if(param){
		if($yours ne ""){
			ChatBot::Control::hear($yours);
		}
	}

	my $bots = ChatBot::Control::say();

	print
		header( -charset => "utf-8" ),
		start_html( -lang => 'ja',
					-title => 'chat bot',
					-encoding => 'utf-8' );

	if($yours ne ""){
		# your saying
		print
			h3( "you:" ),
			"$yours\n",
			hr,"\n";
	}

	# output from bot
	print
		h3( "bot:" ),
		"$bots\n",
		hr,"\n";

	# input to bot
	print
		start_form,
		textfield('sentence'),
		submit,
		end_form,
		"\n";
		
	print end_html();

}
