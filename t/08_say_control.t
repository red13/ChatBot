use strict;
use warnings;
use Test::More;
use ChatBot::Control;

my $ctrl = ChatBot::Control->new;

my $dat = $ctrl->say();

ok $dat;

done_testing;
