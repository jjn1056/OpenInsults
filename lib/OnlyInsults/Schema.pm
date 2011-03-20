package OnlyInsults::Schema;
use parent 'DBIx::Class::Schema';

our $VERSION = 1;

use Data::UUID::Base64URLSafe;

__PACKAGE__->load_namespaces(
  default_resultset_class => 'DefaultRS',
);

my $ug = Data::UUID::Base64URLSafe->new;
sub uuid { $ug->create_b64_urlsafe }

1;

=head1 NAME

OnlyInsults::Schema - Root Schema logic and ORM management

=head2 SYNOPSIS

	my $schema = OnlyInsults::Schema->connect($dsn);
    my $rs = $schema->resultset('User');

=head1 DESCRIPTION

Defines the core domain logic for the application platform.  Good methods to
put here would include everything related to deploying upgrading the database,
business methods that cut across multiple classes, and other logic related to
the database as a whole.

=head1 METHODS

This class defines the following methods

=head2 uuid

Creates a condensed, 22 character UUID suitable for use in PK.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
