package OnlyInsults::Web::Controller::Videos;

use OnlyInsults::Web::Controller;

method start : Chained('/global_start') PathPart('videos') CaptureArgs(0) {}

  method list ($ctx)
  : Chained('start') PathPart('') Args(0)
  {
      $ctx->stash(video_rs => $ctx->model('Schema::Video'));
  }

__PACKAGE__->meta->make_immutable;

=head1 NAME

OnlyInsults::Web::Controller::Root - Root Controller for OnlyInsults::Web

=head1 DESCRIPTION

Root Controller for the web application.  Used to for global settings and
control access.

=head1 ACTIONS

This controller contains the following actions.

=head2 start

top action for controller

=head2 list 

placeholder action, just list them all

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut


