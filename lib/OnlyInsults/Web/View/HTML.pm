package OnlyInsults::Web::View::HTML;

use Moose;
use syntax 'method';
extends 'Catalyst::View::Xslate';

__PACKAGE__->config(
  expose_methods => [qw/url_for_css/],
);

method url_for_css($ctx) {
  $ctx->uri_for_action("/css")->canonical;
}

__PACKAGE__->meta->make_immutable;

=head1 NAME

OnlyInsults::Web::View::HTML - HTML View

=head1 DESCRIPTION

Attempt to render a view, if needed.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut

