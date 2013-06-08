use strict;
use warnings;
use Test::More;
use ChatBot::Model;

my $obj = ChatBot::Model->new(chat_data_path => "data/chat.dat");

my @list = $obj->load_from_chatdata();

my $h = $list[-1];
is $h->{'name'}, 'alice';
is $h->{'sentence'}, 'hello';

done_testing();
