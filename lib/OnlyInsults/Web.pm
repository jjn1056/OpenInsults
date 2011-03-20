package OnlyInsults::Web;

our $VERSION = '0.01';

use Moose;
use Catalyst qw/
    ConfigLoader
/;

extends 'Catalyst';

__PACKAGE__->config(
  name => 'OnlyInsults::Web',
  disable_component_resolution_regex_fallback => 1,    
  'Plugin::ConfigLoader' => {
	file => __PACKAGE__->path_to("share/etc/"),
  },
);

__PACKAGE__->setup;

=head1 NAME

OnlyInsults::Web - A website dedicated to insulting and fun 

=head1 SYNOPSIS

    script/onlyinsults_web_server.pl

=head1 DESCRIPTION

    TBD

=head1 AUTHOR

See L<OnlyInsults> for AUTHOR information

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for COPYRIGHT & LICENSE information

=cut

1;
