package OnlyInsults::Web::Controller::API;

use Locale::Language;
use OnlyInsults::Web::Controller;
extends 'Catalyst::Controller::REST';

has language_rs => (is=>'ro', lazy_build=>1);

method _build_language_rs {
  $self->_app->model('Schema::Language');
}

our $languages;

method start : Chained('/global_start') PathPart('api') CaptureArgs(0) {}

  method languages($ctx)
  : Chained('start') Args(0)
  {
    $languages ||= {map {
      $_->{code_alpha2},
      { en_translation => code2language($_->{code_alpha2}) },
    } $self->language_rs->hri->all};

    $self->status_ok( $ctx, entity => $languages);
  }

__PACKAGE__->meta->make_immutable;

=head1 NAME

OnlyInsults::Web::Controller::API - Expose an API

=head1 DESCRIPTION

Resty API base

=head1 ACTIONS

This controller contains the following actions.

=head2 start

Base of the controller

=head2 languages

allowed languages list

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut


