# ABSTRACT: Perl wrapper for the Jenkins REST API
package WebService::Jenkins;

use Moose;
with 'WebService::Jenkins::Role::Client';
use Moose::Util::TypeConstraints;
use URI;

subtype 'URL' => as class_type('URI');

coerce 'URL'
    => from 'Str'
      => via { URI->new( $_ ) };

has 'url' => (
    isa => 'URL',
    is => 'ro',
    required => 1,
    coerce => 1,
);

has 'api_url' => (
    isa => 'URI',
    is => 'ro',
    lazy_build => 1,
);

sub _build_api_url {
    my ( $self ) = @_;

    return URI->new($self->url->canonical->as_string . "api/json");
}

has 'mode' => (
    isa => 'Str',
    is => 'rw',
);
has 'node_description' => (
    isa => 'Str',
    is => 'rw',
);
has 'node_name' => (
    isa => 'Str',
    is => 'rw',
);
has 'num_executors' => (
    isa => 'Int',
    is => 'rw',
);
has 'description' => (
    isa => 'Str',
    is => 'rw',
);
has 'jobs' => (
    isa => 'ArrayRef[WebService::Jenkins::Job]',
    is => 'rw',
    default => sub { [] },
);
has 'primary_view' => (
    isa => 'WebService::Jenkins::Job',
    is => 'rw',
);
has 'slave_agent_port' => (
    isa => 'Int',
    is => 'rw',
);
has 'use_crumbs' => (
    isa => 'Bool',
    is => 'rw',
);
has 'use_security' => (
    isa => 'Bool',
    is => 'rw',
);
has 'views' => (
    isa => 'ArrayRef[WebService::Jenkins::View]',
    is => 'rw',
    default => sub { [] },
);

1;
