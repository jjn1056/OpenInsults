#!/usr/bin/env perl

use strict;
use warnings;

use OnlyInsults::Web;
use DBIx::Class::DeploymentHandler;
use Getopt::Long;

{
  package OnlyInsults::GeneratedSchema;

  use strict;
  use warnings;

  use parent 'DBIx::Class::Schema::Loader';

  __PACKAGE__->naming('current');
  __PACKAGE__->use_namespaces(1);
  __PACKAGE__->loader_options( );
}


my ($overwrite, $to_version) = (0,0);
GetOptions(
  'v|version=i' => \$to_version,
  'o|overwrite' => \$overwrite,
);

my $schema = OnlyInsults::Web->model('Schema')->schema;

## This bit is probably not right, or maybe an issue in DBIC-DeploymentHandler
## basically seems like got to force schema version along with 'to_version' so
## am not really sure about the difference between these.

## I think has something to do with 

my %version_args;
if($to_version) {
  print "Installing version $to_version\n";
  %version_args = ($to_version ? (to_version => $to_version, schema_version => $to_version) : () );
} else {
  print "No version specified.  Installing ". $schema->VERSION ."\n";
}

my $dh = DBIx::Class::DeploymentHandler->new(
  schema => $schema,
  script_directory => OnlyInsults::Web->config->{db_migrations},
  databases => [qw/SQLite MySQL/],
  sql_translator_args => { add_drop_table => 0 },
  %version_args,
);

if($overwrite) {
  print "Cleaning existing tables\n";
  my $connect_info = $schema->storage->connect_info;
  my $existing_schema = OnlyInsults::GeneratedSchema->connect(@$connect_info);

  $existing_schema->storage->with_deferred_fk_checks(sub {
    foreach my $source ($existing_schema->sources) {
        my $table = $existing_schema->source($source)->name;
        $existing_schema->storage->dbh->do("drop table $table");
    }
  });  
}

$dh->install;

print "Done installing!\n";

