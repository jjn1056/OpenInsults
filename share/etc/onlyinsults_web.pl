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
  'Model::Schema' => {
    schema_class => 'OnlyInsults::Schema',
    traits => ['QueryLog::AdoptPlack'],
	connect_info => {
	  dsn => 'dbi:SQLite:dbname=:memory:',
	},
  },
};


