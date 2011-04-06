package OnlyInsults::Web::View::HTML;

use Moose;
extends 'Catalyst::View::HTML::Zoom';

sub video {
  my ($self, $ctx, $args) = @_;
  $self->render($ctx, 'video.html', $args, sub {
    my ($zoom, %args) = @_;
    $self->wrap_layout($ctx, $zoom, 'layout.html', \%args)
      ->select('h1')
      ->replace_content($args{a});
  });
}

sub wrap_layout {
  my ($self, $ctx, $content, $wrapper_tmpl, $args) = @_;
  my @body;
  $content->select('body')
    ->collect_content({into => \@body})
    ->run;

  $self->render_to_zoom($ctx, $wrapper_tmpl, $args, sub {
    my ($zoom, %args) = @_;
    $zoom->select('body')
      ->replace_content(\@body);
    });
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

