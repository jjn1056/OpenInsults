package OnlyInsults::Web::Controller::Home;

use OnlyInsults::Web::Controller;

method start : Chained('/global_start') PathPart('home') CaptureArgs(0) {}

  method welcome_visitor($ctx)
  : Chained('start') PathPart('') Args(0)
  {
    $ctx->stash(a=>100);
  }

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

=head2 choose_landing 

When a user hits the site we send them to the 'anonymous visitor is welcome'
page or the logged in user home page.  This is a redirect.

=head2 css

Controller to manage our css stylesheets.

=head2 error_404

You get here if nothing matches better, sends the visitor to the default not
found page.

=head2 redirect_to_default_landing

Private method that constructs a redirect response to the default (anonymous)
visitor page.  You can C<$ctx->go('/redirect_to_default_landing')> to this from
anywhere when you need to programmatically redirect.

=head2 end

Attempt to render a view, if needed.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut


