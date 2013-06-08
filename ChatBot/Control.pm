use strict;
use warnings;

use ChatBot::Model;

package ChatBot::Control;

sub new
{
	my ($class, %args) = @_;
	$args{'model'} = ChatBot::Model->new;
	bless \%args, $class;
}

sub say
{
	# return Model::read();
	
	my $self = shift;
	my @data = $self->{'model'}->load_from_chatdata();

	my @output = ();

	for my $num ( 1...3 ){
		if( scalar(@data) > $num ){
			# $output .= "<h3>".$data[0-$num]->{'name'}.":</h3>";
			# $output .= $data[0-$num]->{'sentence'}."\n";
			# $output .= "<hr>";

			push @output, $data[0-$num];
		}
	}

	return @output;
}

sub hear
{
	# my $s = shift;
	# Model::write($s);

	my ($self, $name, $sentence) = @_;

	my @data = $self->{'model'}->save_to_chatdata($name, $sentence) or return undef;
	
	return @data;
}

1;
