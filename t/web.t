use Test::Most;
use Catalyst::Test 'OnlyInsults::Web';

ok request('/')->is_redirect,
  'Request / should redirect';

ok request('/home')->is_success,
  'Request /home should succeed';

done_testing;
