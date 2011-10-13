# ABSTRACT: Convert a Java style boolean into a Perl boolean.
package WebService::Jenkins::Bool;

use Moose::Role;
use Carp qw/ croak /;

sub bool {
    my ( $self, $str ) = @_;

    return 0 unless $str; # Assume undef is false

    croak 'Cannot convert this string'
        unless ( $str eq 'true' || $str eq 'false' );

    my $lookup = {
        true  => 1,
        false => 0,
    }

    return $lookup->{$str};
}

1;
