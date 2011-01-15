package OnlyInsults::Schema::Result::UserRole;
use parent 'OnlyInsults::Schema::Result';

 __PACKAGE__->join_table({
    left_class   => 'User',
    left_method  => 'user',
    right_class  => 'Role',
    right_method => 'role',
});

1;

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
