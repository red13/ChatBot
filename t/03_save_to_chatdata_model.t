use strict;
use warnings;
use Test::More;
use ChatBot::Model;


my $obj = ChatBot::Model->new(chat_data_path => "data/chat.dat");

ok $obj->save_to_chatdata( "alice", "hello" );

done_testing();
