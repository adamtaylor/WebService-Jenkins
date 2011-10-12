use Test::More tests => 6;
use Test::Exception;

use WebService::Jenkins;

my $URL = "http://foobar.com";

my $jenkins = WebService::Jenkins->new({ url => $URL });

isa_ok( $jenkins, WebService::Jenkins, 'Created Webservice::Jenkins instance' );
is( $jenkins->url, $URL, 'url attribute set correctly' );
isa_ok( $jenkins->url, URI, 'url attribute is coerced correctly' );
is( $jenkins->api_url, $URL . "/api/json", 'api_url attribute set correctly' );
isa_ok( $jenkins->api_url, URI, 'api_url attribute is the correct type' );

dies_ok { WebService::Jenkins->new } 'Dies without args';
