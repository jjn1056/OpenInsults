package OnlyInsults::Web::View::CSS;

use Moose;
extends 'Catalyst::View::CSS::Minifier::XS';

__PACKAGE__->meta->make_immutable;

=head1 NAME

OnlyInsults::Web::View::CSS - Squish up CSS for speed

=head1 DESCRIPTION

given a bunch of css stylesheets, squish them up and serve, using the 
last-modified header to help caching.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut

