{
  name => 'OnlyInsults::Web',
  disable_component_resolution_regex_fallback => 1,
  debug_panels => [qw(
    CatalystLog
    DBITrace
    Environment
    Memory
    Parameters
    Response
    DBIC::QueryLog
  )],
};
