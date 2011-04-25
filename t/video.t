use DateTime;
use Test::Most;
use Test::DBIx::Class
  -schema_class => 'OnlyInsults::Schema',
  qw(Video Contributor);

Schema->seed->install;

ok my $video = Video->create({
  title => 'test video',
  description => 'my video is the best!',
  language => { code_alpha2 => 'en' },
  transcript => 'This is a video',
  status => { name => 'available' },
  published_on_site => DateTime->now,
});

ok my $contributor = Contributor->create({
  note => 'hello',
  videos_contributor_rs => [{ video => $video }],
});

done_testing;
