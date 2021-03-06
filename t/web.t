use Test::Most;
use Catalyst::Test 'OnlyInsults::Web';

ok request('/')->is_redirect,
  'Request / should redirect';

ok request('/home')->is_success,
  'Request /home should succeed';

ok request('/some_crap')->is_error(404),
  'Bad URL returns an error';

done_testing;
