package OnlyInsults::Web::Model::Schema;
use Moose;
extends 'Catalyst::Model::DBIC::Schema';

after 'BUILD', sub {
  my $schema = $_[0]->schema;
  $schema->deploy;
  $schema->resultset('User')->create({
    email => 'onken@netcubed.de', 
  });
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
 
