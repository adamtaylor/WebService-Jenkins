package WebService::Jenkins::Role::Client;

use Moose::Role;
use LWP::UserAgent;
use JSON;
use Carp qw/ croak /;

has 'ua' => (
    isa => 'LWP::UserAgent',
    is => 'ro',
    lazy_build => 1,
);

sub _build_ua {
    my ( $self ) = @_;

    return LWP::UserAgent->new;
}

sub request {
    my ( $self, $url ) = @_;

    croak "URL required" unless $url;

    my $resp = $self->ua->request( $self->_api_url($url) );

    if ( $resp->is_success ) {
        return json_decode $resp->content;
    }
    else {
        croak "Request failed: " . $resp->content;
    }
}

sub _api_url {
    my ( $self, $url ) = @_;

    return $url . "api/json";
}

1;
