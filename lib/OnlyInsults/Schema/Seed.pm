package OnlyInsults::Schema::Seed;

use Moose;
use Locale::Language;

has schema => (is=>'ro', required=>1);

sub core_fixtures_to_always_install { qw/languages users/ }

sub install {
  my ($self, @fixtures) = @_;
  $self->${\"_install_$_"}()
    for ($self->core_fixtures_to_always_install, @fixtures);
}

sub _install_languages {
  my $self = shift;
  $self->schema->populate('Language',[
    ['language_id', 'code_alpha2'], 
    map {
      [$self->schema->uuid, $_]
    } all_language_codes('alpha2'),
  ]);
}

sub _install_users {
  shift
    ->schema
    ->resultset('User')->create({
      email => 'jjn1056@yahoo.com', 
   });
}

1;

=head1 NAME

OnlyInsults::Schema::Seed - Manage the initial data load

=head2 SYNOPSIS

	OnlyInsults::Schema::Seed
      ->new(schema=>$schema)
      ->install(@fixtures);
    
=head1 DESCRIPTION

Used to seed an empty database when fixtures are not available.  Ideally
this will eventually detect that you have fixture sets and then you'd use those
instead, since bulkb populate would be faster.

=head1 METHODS

This class defines the following methods

=head2 fixtures_to_install

A list referring to the fixture deployment methods we will run.

=head2 install

Wraps the deploy method so that we hook in to setup the basic fixtures.

Creates a condensed, 22 character UUID suitable for use in PK.

=head2 _install_languages

Run a method to populate the languages table

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
