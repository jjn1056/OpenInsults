package OnlyInsults::Web::View::HTML;
use Moose;
extends 'Catalyst::View::MicroTemplate';

__PACKAGE__->meta->make_immutable;

=head1 NAME

OnlyInsults::Web::View::HTML - HTML View

=head1 DESCRIPTION

Root Controller for the web application.  Used to for global settings and
control access.

Attempt to render a view, if needed.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut

