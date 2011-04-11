package OnlyInsults::Web::Controller::Root;

use OnlyInsults::Web::Controller;

__PACKAGE__->config(namespace => '');

method global_start : Chained('/') PathPart('') CaptureArgs(0) {}

  method welcome($ctx) : Chained(global_start) PathPart('') Args(0)
  {
    $ctx->response->body( $ctx->welcome_message );
  }

  method video($ctx) : Chained(global_start) Args(0)
  {
    my $body = $ctx->view('HTML')->video($ctx, {a=>100});
    $ctx->res->body($body);
  }

method end : ActionClass(RenderView) {}

__PACKAGE__->meta->make_immutable;

=head1 NAME

OnlyInsults::Web::Controller::Root - Root Controller for OnlyInsults::Web

=head1 DESCRIPTION

Root Controller for the web application.  Used to for global settings and
control access.

=head1 ACTIONS

This controller contains the following actions.

=head2 global_start

Everything hits this action, it defines the root of the web application.
Anything that always needs to happen needs to go here (but use care, since
anything here always gets executed.)

=head2 welcome 

Make sure this all works

=head2 end

Attempt to render a view, if needed.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut


