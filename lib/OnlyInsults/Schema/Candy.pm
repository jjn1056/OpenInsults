package OnlyInsults::Schema::Candy;
use parent 'DBIx::Class::Candy';

sub base { $_[1] || 'OnlyInsults::Schema::Result' }

1;

=head1 NAME

OnlyInsults::Schema::Candy - My Candy Class

=head1 SYNOPSIS

	package OnlyInsults::Schema::Result::User;
    use OnlyInsults::Schema::Candy;;
	
=head1 DESCRIPTION

Our custom subclass of L<DBIx::Class::Candy>

=head1 METHODS

This module defines the following methods.

=head2 base

Sets the base class for all Resukts

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut


