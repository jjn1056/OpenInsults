use Test::Most;
use Catalyst::Test 'OnlyInsults::Web';

ok request('/')->is_success,
  'Request should succeed';

done_testing;
