package OnlyInsults::Schema::Result::UserRole;

use OnlyInsults::Schema::Candy;

table 'user_role';

column 'user_id' => {
  data_type => 'varchar',
  size => '22',
};

column 'role_id' => {
  data_type => 'varchar',
  size => '22',
};

primary_key 'user_id', 'role_id';
belongs_to user => ('::User', 'user_id');
belongs_to role => ('::Role', 'role_id');

1;

__END__

join_table {
  left_class   => 'User',
  left_method  => 'user',
  right_class  => 'Role',
  right_method => 'role',
};

=head1 NAME

OnlyInsults::Schema::Result::UserRole - User to Role Join table.

=head1 DESCRIPTION

Join table between User and Role entities.

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
