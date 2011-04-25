#!/usr/bin/env perl

## If you create a new version of the schema or change a version you should
## dump fixtures for that version and run tests.

use strict;
use warnings;

use File::Spec;
use DBIx::Class::Fixtures;
use OnlyInsults::Web;
use DBIx::Class::DeploymentHandler;
use SQL::Translator;
use Getopt::Long;

my ($debug) = (0);
GetOptions(
  'd|debug' => \$debug,
);

my $schema = OnlyInsults::Web->model('Schema')->schema;
my $config_dir = OnlyInsults::Web->config->{db_fixture_config_sets};
my $dh = DBIx::Class::DeploymentHandler->new(
  schema => $schema,
  script_directory => OnlyInsults::Web->config->{db_migrations},
);

{
  package OnlyInsults::GeneratedSchema;

  use strict;
  use warnings;

  use parent 'DBIx::Class::Schema::Loader';

  __PACKAGE__->naming('current');
  __PACKAGE__->use_namespaces(1);
  __PACKAGE__->loader_options( );
}

my $version = $schema->VERSION;
if($dh->database_version ne $version) {
  print "Database version is not the same as current schema.  Building Schema.\n";
  my $connect_info = $schema->storage->connect_info;
  ## This needs to be way smarter to work.
  ##$schema = OnlyInsults::GeneratedSchema->connect(@$connect_info);
  $version = $dh->database_version;
}

#my $fn = $dh->deploy_method->_ddl_protoschema_produce_filename($version);
#my $t = SQL::Translator->new(
#  parser => 'YAML',
#  producer => 'DBIx::Class::File',
#  producer_args => {
#    prefix => 'OnlyInsults::GeneratedSchema',
#  },
#);
#die $t->translate( $fn );

DBIx::Class::Fixtures
  ->new({
    config_dir => File::Spec->catdir($config_dir, $version),
    debug => $debug,
  })
  ->dump_all_config_sets({
    schema => $schema,
    directory_template => sub {
      my ($fixture, $params, $set) = @_;
        File::Spec->catdir(
          OnlyInsults::Web->config->{db_fixtures_dump_dir},
          $version,
          $set,
        );
    },
  });

