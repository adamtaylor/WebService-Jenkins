package WebService::Jenkins::Job;

use Moose;
with 'WebService::Jenkins::Role::Client';

use Carp qw/ croak /;

has 'description' => (
    isa => 'Str',
    is => 'rw',
);
has 'display_name' => (
    isa => 'Str',
    is => 'rw',
);
has 'name' => (
    isa => 'Str',
    is => 'ro',
    required => 1,
);
has 'url' => (
    isa => 'Str',
    is => 'ro',
    required => 1,
);
has 'buildable' => (
    isa => 'Bool',
    is => 'rw',
);
has 'builds' => (
    isa => 'ArrayRef[WebService::Jenkins::Build]',
    is => 'rw',
);
has 'color' => (
    isa => 'Str',
    is => 'ro',
    required => 1,
);
has 'first_build' => (
    isa => 'WebService::Jenkins::Build',
    is => 'rw',
);
has 'health_report' => (
    isa => 'Str',
    is => 'rw',
);
has in_queue => (
    isa => 'Bool',
    is => 'rw',
);
has 'last_build' => (
    isa => 'WebService::Jenkins::Build',
    is => 'rw',
);
has 'last_completed_build' => (
    isa => 'WebService::Jenkins::Build',
    is => 'rw',
);
has 'last_failed_build' => (
    isa => 'WebService::Jenkins::Build',
    is => 'rw',
);
has 'last_stable_build' => (
    isa => 'WebService::Jenkins::Build',
    is => 'rw',
);
has 'last_unstable_build' => (
    isa => 'WebService::Jenkins::Build',
    is => 'rw',
);
has 'last_unsuccessful_build' => (
    isa => 'WebService::Jenkins::Build',
    is => 'rw',
);
has 'next_build_number' => (
    isa => 'Int',
    is => 'rw',
);

sub new_from_url {
    my ( $self, $args ) = @_;

    my @args = qw/ url name color/;

    for ( @args ) {
        croak "$_ argument required" unless $args->{$_}
    }

    my $url   = delete $args->{url};
    my $name  = delete $args->{name};
    my $color = delete $args->{color};

    croak "Unexpected arguments" if $args;

    my $resp = $self->request( $args->{url} );
}

1;
