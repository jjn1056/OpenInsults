#!/usr/bin/env perl
 
use strict;
use warnings;

use File::Spec;
use DBIx::Class::Fixtures;
use OnlyInsults::Web;
use OnlyInsults::Schema::Seed;

my $config_dir = OnlyInsults::Web->config->{db_fixture_config_sets};
my $fixtures_dir = OnlyInsults::Web->config->{db_fixtures_dump_dir};
my $fixtures = DBIx::Class::Fixtures->new({
  config_dir => $config_dir, debug=>1,
});

sub {
  my $schema = shift;
  my $fixture_dir = File::Spec->catdir($fixtures_dir, 1, 'core.json');
  if( -e $fixture_dir ) {
    print "Deploying the core.json fixture configuration set\n";
    $fixtures->populate({
      no_deploy => 1,
      schema => $schema,
      directory => $fixture_dir,
    });
  } else {
    print "Skipping fixture installation since you don't have them\n";
    print "Instead I will seed the database manually\n";

    OnlyInsults::Schema::Seed
      ->new(schema=>$schema)
      ->install;
  }
};

