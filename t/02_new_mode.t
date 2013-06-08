use strict;
use warnings;
use Test::More;
use ChatBot::Model;

my $obj = ChatBot::Model->new;
isa_ok $obj, 'ChatBot::Model';

my $obj2 = ChatBot::Model->new(chat_data_path => "/data/chat.dat") ;
isa_ok $obj2, 'ChatBot::Model';

done_testing();
