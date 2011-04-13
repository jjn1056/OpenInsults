{
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
  },
  'Model::Schema' => {
    schema_class => 'OnlyInsults::Schema',
    traits => ['QueryLog::AdoptPlack'],
	connect_info => {
	  dsn => 'dbi:SQLite:dbname=:memory:',
	},
  },
  'View::HTML' => {
    path =>  ['__path_to(share,templates)__'],
    module => [
      'Text::Xslate::Bridge::TT2Like',
    ],
  },
  'View::CSS' => {
    path => '__path_to(share,static,css)__',
  },
};


