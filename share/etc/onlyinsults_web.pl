use strict;
use warnings;

use File::Spec;
use File::HomeDir;

my $docs_dir = File::HomeDir->my_documents;
my $data_dir = File::HomeDir->my_dist_data('OnlyInsults-Web', {create=>1});

my $conf = {
  debug_panels => [
    qw(
      Timer
      CatalystLog
      DBITrace
      Response
      Environment
      Parameters
      Memory
    ),
    [ 'DBIC::QueryLog', querylog_args => {passthrough=>1}],
  ],
  default_view => 'HTML',
  'Plugin::Session' => {
    cookie_expires => 0,
    storage => File::Spec->catfile($data_dir, 'var', 'session'),
  },
  'Plugin::Cache' => {
    backend => {
      class => 'Cache::FastMmap',
      share_file => File::Spec->catfile($data_dir, 'var', 'cache'),
      cache_size => '16m',
    },
  },
  'Controller::Root' => {
    namespace => '',
    core_stylesheets => ['global.css', 'page.css', 'layouts.css',
      'bits.css', 'forms.css', 'debug.css', 'portlet.css'],
    default_landing_action => '/home/welcome_visitor',
  },
  db_migrations => '__path_to(share,migrations)__',
  db_fixture_config_sets => '__path_to(share,etc,fixture_config_sets)__',
  db_fixtures_dump_dir => File::Spec->catdir($docs_dir, 'onlyinsults_fixtures'),
  'Model::Schema' => {
    schema_class => 'OnlyInsults::Schema',
    traits => ['QueryLog::AdoptPlack', 'Caching'],
    connect_info => {
      dsn => 'dbi:SQLite:dbname='. File::Spec->catfile($data_dir, 'var', 'sqlite.db'),
      cursor_class => 'DBIx::Class::Cursor::Cached',
      on_connect_do => [ 'PRAGMA foreign_keys = ON' ],
    },
  },
  'View::CSS' => {
    path => '__path_to(share,static,css)__',
  },
  'View::HTML' => {
    path =>  ['__path_to(share,templates)__'],
    module => ['Text::Xslate::Bridge::TT2Like'],
  },
};


