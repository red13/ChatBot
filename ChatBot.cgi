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
	my $cntl = ChatBot::Control->new();

	my $name = param('name');
	my $msg = param('sentence');

	if( param ){
		if( $name ne "" && $msg ne "" ){
			$cntl->hear($name, $msg);
		}
	}

	my @chat = $cntl->say();

	print
		header( -charset => "utf-8" ),
		start_html( -lang => 'ja',
					-title => 'chat bot',
					-encoding => 'utf-8' );

	# if($yours ne ""){
	# 	# your saying
	# 	print
	# 		h3( "you:" ),
	# 		"$yours\n",
	# 		hr,"\n";
	# }

	# # output from bot
	# print
	# 	h3( "bot:" ),
	# 	"$bots\n",
	# 	hr,"\n";

	for my $dat (@chat){
		print
			h3( $dat->{'name'}.":" ),
			$dat->{'sentence'},hr,"\n";
	}

	# form for input to bot
	print
		start_form,
		"name:",textfield( -name => 'name',
						   -value => $name ),
		br,
		"msg:",textfield( -name => 'sentence',
						  -value => ""),
		submit,
		end_form,
		"\n";

	print
		start_form,
		submit('reload'),
		end_form,
		"\n";
		
	print end_html();

}
