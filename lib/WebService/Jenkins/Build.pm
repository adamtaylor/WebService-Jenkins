package WebService::Jenkins::Build;

use Moose;
with 'WebService::Jenkins::Role::Client';

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

);

has 'artifacts' => (

);

has 'building' => (

);

has 'description' => (

);

has 'duration' => (

);

has 'full_display_name' => (

);

has 'id' => (

);

has 'keep_log' => (

);

has 'number' => (

);

has 'result' => (

);

has 'timestamp' => (

);

has 'url' => (

);

has 'built_on' => (

);

has 'change_set' => (

);

has 'culprits' => (

);


1;
