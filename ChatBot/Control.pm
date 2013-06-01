use strict;
use warnings;

use ChatBot::Model;

package ChatBot::Control;

sub say
{
	return ChatBot::Model::read();
}

sub hear
{
	my $s = shift;
	ChatBot::Model::write($s);
	return;
}

1;
