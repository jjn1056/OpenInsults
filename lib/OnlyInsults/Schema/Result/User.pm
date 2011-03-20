package OnlyInsults::Schema::Result::User;

use OnlyInsults::Schema::Candy;

table 'user';

column 'user_id' => {
  data_type => 'varchar',
  size => '22',
};

column 'email' => {
  data_type => 'varchar',
  size => '96',
};

column 'created' => {
  data_type => 'datetime', 
  set_on_create => 1,
  set_on_update => 1,
};

primary_key 'user_id';

unique_constraint ['email'];

has_many user_roles_rs => ('::UserRole', 'user_id');
many_to_many roles => ('user_roles_rs', 'role');

1;

=head1 NAME

OnlyInsults::Schema::Result::User - A user on the site

=head1 SYNOPSIS

    my $user = $schema->resultset('User')->first;
    say $user->email;

=head1 DESCRIPTION

Someone with some sort of rights to the site

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
