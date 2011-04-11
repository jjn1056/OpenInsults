package OnlyInsults::Web::View::HTML;

use Moose;
extends 'Catalyst::View::HTML::Zoom';

sub video {
  my ($self, $ctx, $args) = @_;
  $self->render($ctx, 'video.html', $args, sub {
    my ($zoom, %args) = @_;
    $self->wrap_layout($zoom, \%args)
      ->select('h1')
      ->replace_content($args{a});
  });
}

## Basic Wrapper
sub wrap_layout {
  my ($self, $inner_zoom, $args) = @_;
  return $self->wrap_with($inner_zoom, 'layout.html', $args);
}

## Generic Wrapper Builder
sub wrap_with {
  my ($self, $inner_zoom, $wrapper_tmpl, $args) = @_;
  my @body;
  $inner_zoom->select('body')
    ->collect_content({into => \@body})
    ->run;

  return $self->_build_zoom_from($wrapper_tmpl)
    ->select('body')
    ->replace_content(\@body);
}

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

