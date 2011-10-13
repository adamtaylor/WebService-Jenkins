use Test::More tests => 4;

use Test::Exception;
use WebService::Jenkins::Job;

my $build_args = {
    color => 'red',
    name  => 'job',
    url   => 'url'
};

my $job = WebService::Jenkins::Job->new( $build_args );
isa_ok( $job, WebService::Jenkins::Job, 'Instantiated the correct class' );

dies_ok { WebService::Jenkins::Job->new } 'Dies without params';

throws_ok { WebService::Jenkins::Job->new } qr/argument required/,
    'Missing argument exception thrown';

$build_args->{foo} = 'bar';
throws_ok { WebService::Jenkins::Job->new( $build_args ) }
    qr/Unexpected arguments/, 'Unexpected argument exception thrown';
