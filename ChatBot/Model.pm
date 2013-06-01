use strict;
use warnings;

package ChatBot::Model;

sub write
{
	my $s = shift;

	open my $fd, ">>", "ChatBot/data/bot.dat";
	print $fd $s."\n";
	close $fd;

	return;
}

sub read
{
	open my $fd, "<", "ChatBot/data/bot.dat";
	my @dat = <$fd>;
	close $fd;

	my $out = "hello!";
	my $num = scalar(@dat);
	if($num > 0){
		my $i = int(rand($num));
		if( $dat[$i] ne "" ){
			$out = $dat[$i];
		}
	}
	
	return $out;
}

1;
