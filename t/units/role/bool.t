use Test::More tests => 2;

my $bool = BoolTest->new;
is( $bool->bool('true'), 1, 'True converted correctly' );
is( $bool->bool('false'), 0, 'False converted correctly' );

# Quick class to test the role, built before the rest of the runtime code
BEGIN {
    package BoolTest;
    use Moose;
    with 'WebService::Jenkins::Role::Bool';
    1;
}
