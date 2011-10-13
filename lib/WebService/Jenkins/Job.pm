package WebService::Jenkins::Job;

use Moose;
with 'WebService::Jenkins::Role::Client'
     'WebService::Jenkins::Role::Bool';

use Carp qw/ croak /;
use Storable;

has 'data' => (
    isa => 'HashRef',
    is => 'ro',
    lazy_build => 1,
);
sub _build_data {
    my ( $self ) = @_;

    return $self->client->request( $self->url );
};

has 'description' => (
    isa => 'Str',
    is => 'ro',
    lazy_build => 1,
);
sub _build_description {
    my ( $self ) = @_;

    return $self->data->{description};
}

has 'display_name' => (
    isa => 'Str',
    is => 'ro',
    lazy_build => 1,
);
sub _build_display_name {
    my ( $self ) = @_;

    return $self->data->{displayName};
}

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
    is => 'ro',
    lazy_build => 1,
);
sub _build_buildable {
    my ( $self ) = @_;

    return $self->bool($self->data->{buildable});
}

has 'builds' => (
    isa => 'ArrayRef[WebService::Jenkins::Build]',
    is => 'ro',
    lazy_build => 1,
);
sub _build_builds {
    my ( $self ) = @_;
};

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

# Intercept massive Moose stacktraces and throw more human friendly errors.
# Uneccesary?
around BUILDARGS => sub {
    my ( $orig, $class, $args ) = @_;

    $args = Storable::dclone($args) if ref $args;

    my @args = qw/url name color/;

    for ( @args ) {
        croak "$_ argument required" unless $args->{$_}
    }

    my $url   = delete $args->{url};
    my $name  = delete $args->{name};
    my $color = delete $args->{color};

    croak "Unexpected arguments" if keys %{$args};

    $class->$orig({
        url   => $url,
        name  => $name,
        color => $color,
    });
};

1;
