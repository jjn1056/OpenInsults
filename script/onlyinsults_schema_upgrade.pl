#!/usr/bin/env perl
 
use strict;
use warnings;

use OnlyInsults::Web;
use DBIx::Class::DeploymentHandler;
use Getopt::Long;

my ($to_version) = (0);
GetOptions(
  'v|version=i' => \$to_version,
);

my $schema = OnlyInsults::Web->model('Schema')->schema;

my %version_args;
if($to_version) {
  print "Installing version $to_version\n";
  %version_args = ($to_version ? (to_version => $to_version, schema_version => $to_version) : () );
} else {
  print "No version specified.  Upgrading to: ". $schema->VERSION;
  %version_args = (to_version => $schema->VERSION;, schema_version => $schema->VERSION);
}

my $dh = DBIx::Class::DeploymentHandler->new({
  schema => $schema,
  %version_args,
  script_directory => OnlyInsults::Web->config->{db_migrations},
});

print "About to upgrade from version ". $dh->database_version. " to $version_args{to_version}\n";

$dh->upgrade;
