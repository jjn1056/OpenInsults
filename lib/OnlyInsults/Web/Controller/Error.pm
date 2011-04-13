package OnlyInsults::Web::Controller::Error;

use OnlyInsults::Web::Controller;

method start : Chained('/global_start') PathPart('') CaptureArgs(0) {}

  method not_found($ctx) :Chained('start') Args {
    $ctx->stash(missing => scalar($ctx->request->uri));
    $ctx->response->status(404);
  }

  method unauthorized($ctx) :Chained('start')  Args {
    $ctx->stash(blocked => scalar($ctx->request->uri));
    $ctx->response->status(401);
  }


  method internal_error($ctx) :Chained('start')  Args {
    $ctx->response->status(500);
  }

__PACKAGE__->meta->make_immutable;

=head1 NAME

OnlyInsults::Web::Controller::Error - Error Controller for OnlyInsults::Web

=head1 DESCRIPTION

Display Error pages

=head1 ACTIONS

This controller contains the following actions.

=head2 start

Base of the controller

=head2 not_found

    TBD

=head2 unauthorized

    TBD

=head2 internal_error

    TBD

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut


