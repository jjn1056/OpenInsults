package Test::OnlyInsults::Schema;
use parent 'OnlyInsults::Schema';

use Locale::Language;

our $VERSION = OnlyInsults::Schema->VERSION;

sub fixtures_to_deploy { qw/languages/ }

sub deploy {
  my $self = shift;
  $self->next::method(@_);
  $self->${\"_deploy_$_"}()
    for $self->fixtures_to_deploy;
}

sub _deploy_languages {
  my $self = shift;
  $self->populate('Language',[
    ['language_id', 'code_alpha2'], 
    map {
      [$self->uuid, $_]
    } all_language_codes('alpha2'),
  ]);
}

1;

=head1 NAME

Test::OnlyInsults::Schema - Subclass of OnlyInsults::Schema for Automated tests

=head2 SYNOPSIS

	my $schema = OnlyInsults::Schema->connect($dsn);
    my $rs = $schema->resultset('User');

=head1 DESCRIPTION

Subclass of L<OnlyInsults::Schema> with some extra utility methods to help with
testings and automated smoke tests.

=head1 METHODS

This class defines the following methods

=head2 fixtures_to_deploy

A list referring to the fixture deployment methods we will run.

=head2 deploy

Wraps the deploy method so that we hook in to setup the basic fixtures.

Creates a condensed, 22 character UUID suitable for use in PK.

=head2 _deploy_languages

Run a method to populate the languages table

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
