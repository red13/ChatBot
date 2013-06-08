use strict;
use warnings;
use Test::More;
use ChatBot::Control;

my $ctrl = ChatBot::Control->new;
isa_ok $ctrl, "ChatBot::Control";

done_testing;
