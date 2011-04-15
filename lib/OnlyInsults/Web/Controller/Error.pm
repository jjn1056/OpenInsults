package OnlyInsults::Web::Controller::Error;

use OnlyInsults::Web::Controller;

method not_found($ctx) :Private {
  $ctx->stash(missing => scalar($ctx->request->uri));
  $ctx->response->status(404);
}

method unauthorized($ctx) :Private {
  $ctx->stash(blocked => scalar($ctx->request->uri));
  $ctx->response->status(401);
}


method internal_error($ctx) :Private {
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

Handle the generic not found case

=head2 unauthorized

Handle the case when the user is not allowed to do something

=head2 internal_error

The "I don't know what happened."

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut


