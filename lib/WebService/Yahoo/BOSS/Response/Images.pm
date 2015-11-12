package WebService::Yahoo::BOSS::Response::Images;

=head1 NAME

WebService::Yahoo::BOSS::Response::Images

=cut

use Moo;

use Carp qw(croak);

has 'format'            => ( is => 'ro', required => 1 );
has 'size'              => ( is => 'ro', required => 1 );
has 'refererclickurl'   => ( is => 'ro', required => 1 );
has 'refererurl'        => ( is => 'ro', required => 1 );
has 'height'            => ( is => 'ro', required => 1 );
has 'width'             => ( is => 'ro', required => 1 );
has 'thumbnailurl'      => ( is => 'ro', required => 1 );
has 'thumbnailheight'   => ( is => 'ro', required => 1 );
has 'thumbnailwidth'    => ( is => 'ro', required => 1 );
has 'title'             => ( is => 'rw', required => 1 );
has 'url'               => ( is => 'ro', required => 1 );
has 'clickurl'          => ( is => 'ro', required => 1 );

sub parse {
    my ($class, $bossresponse) = @_;

    my $images = $bossresponse->{images}
        or croak "bossresponse doesn't contain a 'images' data: @{[ keys %$bossresponse ]}";

    my @imageresults;
    foreach my $result ( @{ $images->{results} } ) {
        push @imageresults, $class->new($result);
    }

    return {
        count        => $images->{count},
        totalresults => $images->{totalresults},
        start        => $images->{start},
        results      => \@imageresults,
    };
}


1;
