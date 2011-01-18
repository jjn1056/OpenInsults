package OnlyInsults::Web::Model::Schema;
use Moose;
use Locale::Language;
use UUID::Tiny ':std';

extends 'Catalyst::Model::DBIC::Schema';

after 'BUILD', sub {
  my $schema = $_[0]->schema;

  $schema->deploy;

  $schema->resultset('User')->create({
    email => 'onken@netcubed.de', 
  });

  $schema
    ->resultset('Language')
    ->populate([
      ['language_id', 'code_alpha2'], 
      map {
        [create_uuid_as_string(), $_]
      } all_language_codes('alpha2'),
  ]);
};

1;
 
=head1 NAME
 
OnlyInsults::Web::Model::Schema - Database adaptor
 
=head1 DESCRIPTION
 
Links the database into the web application
 
=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut 
 
