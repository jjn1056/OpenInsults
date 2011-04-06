package OnlyInsults::Web::Model::Schema;
use Moose;
use Locale::Language;
use UUID::Tiny ':std';

extends 'Catalyst::Model::DBIC::Schema';

after 'BUILD', sub {
  my $schema = $_[0]->schema;

  $schema->deploy;

  $schema->resultset('User')->create({
    email => 'jjn1056@yahoo.com', 
  });

  $schema
    ->resultset('Language')
    ->populate([
      ['language_id', 'code_alpha2'], 
      map {
        [$schema->uuid, $_]
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
 
