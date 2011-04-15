my $conf = {
  default_view => 'HTML',
  debug_panels => [qw(
    Timer
    CatalystLog
    DBITrace
    DBIC::QueryLog
    Response
    Environment
    Parameters
    Memory
  )],
  'Controller::Root' => {
    namespace => '',
    core_stylesheets => ['global.css', 'page.css', 'layouts.css',
      'bits.css', 'forms.css', 'debug.css', 'portlet.css'],
    default_landing_action => '/home/welcome_visitor',
  },
  'Model::Schema' => {
    schema_class => 'OnlyInsults::Schema',
    traits => ['QueryLog::AdoptPlack'],
    connect_info => {
      dsn => 'dbi:SQLite:dbname=:memory:',
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


