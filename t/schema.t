use Test::Most;
use OnlyInsults::Web;

ok my $user_rs = OnlyInsults::Web->model('Schema::User'),
  'got a user resultset';

done_testing;
