use Test::Most;
use Test::Requires qw(Test::LeakTrace);
use Plack::Test;
use HTTP::Request::Common qw(GET);
use OnlyInsults::Web;

ok (
  my $cb = sub {
    $_[0]->(GET '/'); ## TODO Add more URLs that might leak
    $_[0]->(GET '/video');
  },
  'Created callback function for test_psgi',
);

no_leaks_ok (
  sub {
    my $total = $ENV{LEAK_TEST_ITERATIONS} || 5;
    for (1..$total) {
      test_psgi(OnlyInsults::Web->psgi_app, $cb);
    }
  }, 
  'No leaks in application',
);

done_testing;
