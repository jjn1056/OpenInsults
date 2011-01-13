package OnlyInsults::Web;

our $VERSION = '0.01';

use Moose;
use Catalyst qw/
    -Debug
    ConfigLoader
/;

extends 'Catalyst';

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
