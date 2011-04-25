#!/usr/bin/env perl

## Use this script to prepare a new version of the database into the migrations
## area.  This doesn't actually install the database, just prepares files

use strict;
use warnings;

use OnlyInsults::Web;
use OnlyInsults::Schema;
use DBIx::Class::DeploymentHandler;
use Getopt::Long;

my ($overwrite, $from_version);
GetOptions(
  'p|previous-version' => \$from_version,
  'o|overwrite' => \$overwrite,
);

## We do this dance since if we use the $schema from the Catalyst model we
## get that Model namespace inside the dumped YAML files.  Doesn't seem to
## hurt but can't be good either.

my $schema = OnlyInsults::Web->model('Schema')->schema;
my $connect_info = $schema->storage->connect_info;
$schema = OnlyInsults::Schema->connect(@$connect_info);


my $version = $schema->VERSION;
my $dh = DBIx::Class::DeploymentHandler->new(
  schema => $schema,
  script_directory => OnlyInsults::Web->config->{db_migrations},
  databases => [qw/SQLite MySQL/],
  sql_translator_args => { add_drop_table => 0 },
  force_overwrite => $overwrite,
);

print "Preparing deployment files for Schema Version: $version\n";
$dh->prepare_install;

if($version > 1) {
  $from_version = $from_version ? $from_version : $version - 1;  

  print "Preparing upgrade files from $from_version to $version\n";
  $dh->prepare_upgrade({
    from_version => $from_version,
    to_version   => $version,
    version_set  => [ $from_version, $version ],
  });

  print "Preparing downgrade files from $version to $from_version\n";
  $dh->prepare_downgrade({
    from_version => $version,
    to_version   => $from_version,
    version_set  => [ $version, $from_version],
  });
}

print "Generated Deployment scripts\n";
