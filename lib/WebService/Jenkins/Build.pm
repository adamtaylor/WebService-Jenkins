package WebService::Jenkins::Build;

use Moose;
with 'WebService::Jenkins::Role::Client',
     'WebService::Jenkins::Role::Bool';

has 'data' => (
    isa => 'HashRef',
    is => 'ro',
    lazy_build => 1,
);
sub _build_data {
    my ( $self ) = @_;

    return $self->client->request( $self->url );
};

has 'actions' => (
    isa => 'WebService::Jenkins::Build::Actions',
    is => 'ro',
    lazy_build => 1,
);

has 'artifacts' => (
    isa => 'ArrayRef',
    is => 'ro',
    lazy_build => 1,
);

has 'building' => (
    isa => 'Bool',
    is => 'ro',
    lazy_build => 1,
);

has 'description' => (
    isa => 'Str',
    is => 'ro',
    lazy_build => 1,
);

has 'duration' => (
    isa => 'Int',
    is => 'ro',
    lazy_build => 1,
);

has 'full_display_name' => (
    isa => 'Str',
    is => 'ro',
    lazy_build => 1,
);

has 'id' => (
    isa => 'DateTime', # XXX well kinda?
    is => 'ro',
    lazy_build => 1,
);

has 'keep_log' => (
    isa => 'Bool',
    is => 'ro',
    lazy_build => 1,
);

has 'number' => (
    isa => 'Int',
    is => 'ro',
    lazy_build => 1,
);

has 'result' => (
    isa => 'Str', # XXX More like an Enum?
    is => 'ro',
    lazy_build => 1,
);

has 'timestamp' => (
    isa => 'DateTime', # XXX epoc based
    is => 'ro',
    lazy_build => 1,
);

has 'url' => (
    isa => 'Str',
    is => 'ro',
    required => 1,
);

has 'built_on' => (

);

has 'change_set' => (
    isa => 'WebService::Jenkns::Build::ChangeSet',
    is => 'ro',
    lazy_build => 1,
);

has 'culprits' => (
    isa => 'ArrayRef[Str]',
    is => 'ro',
    lazy_build => 1,
);


1;
