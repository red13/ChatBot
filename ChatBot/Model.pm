use strict;
use warnings;

package ChatBot::Model;

# data format
#  - name
#  - sentence

sub new
{
	my ($class, %args) = @_;
	if( ! $args{'chat_data_path'} ){
		$args{'chat_data_path'} = "data/chat.dat";
	}
	if( ! $args{'bot_data_path'} ){
		$args{'bot_data_path'} = "data/bot.dat";
	}
	bless \%args, $class;
}

sub save_to_chatdata
{
	my ($self, $name, $sentence) = @_;

	open my $fd, ">>", $self->{'chat_data_path'} or return undef;
	print $fd $name.":".$sentence."\n";
	close $fd;

	return $self;
}

sub load_from_chatdata
{
	my $self = shift;

	open my $fd, "<", $self->{'chat_data_path'} or return ();
	my @data = <$fd>;
	close $fd;

	my @ret = ();
	foreach my $body (@data){
		my %h;
		($h{'name'}, $h{'sentence'}) = split( /:/, $body, 2 );
		chomp($h{'sentence'});
		push(@ret, \%h);
	}
	
	return @ret;
}

sub save_to_botdata
{
	my $self = shift;
	my $data = shift;

	open my $fd, ">>", "ChatBot/data/bot.dat" or return undef;
	print $fd $data->{'sentence'}."\n";
	close $fd;

	return $self;
}

sub read_from_botdata
{
	my $self = shift;
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
