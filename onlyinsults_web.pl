{
  name => 'Freestock::Web',
  disable_component_resolution_regex_fallback => 1,
  default_view => 'HTML',
  debug_panels => [qw(
    Timer
    CatalystLog
    DBITrace
    Response
    Environment
    Parameters
    Memory
  )],
};


