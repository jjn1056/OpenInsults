package OnlyInsults::Schema::Result::Role;

use DBIx::Class::Candy
  -base => 'OnlyInsults::Schema::Result';

table 'role';

column 'role_id' => {
  data_type => 'varchar',
  size => '36',
};

column 'title' => {
  data_type => 'varchar',
  size => '24',
};

column 'description' => {
  data_type => 'varchar',
  size => '64',
};

primary_key 'role_id';

unique_constraint ['title'];
unique_constraint ['description'];

has_many 'users_role_rs' => ('OnlyInsults::Schema::Result::UserRole', 'role_id');
many_to_many users => ('users_role_rs', 'user');

1;

=head1 NAME

OnlyInsults::Schema::Result::Role - An ability related to site access for a User

=head1 DESCRIPTION

Someone with some sort of rights to the site

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
