use strict;
use warnings;
use Test::More;
use ChatBot::Control;

my $ctrl = ChatBot::Control->new;

ok $ctrl->hear("bob", "good morning");


done_testing;
