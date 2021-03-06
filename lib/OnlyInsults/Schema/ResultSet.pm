package OnlyInsults::Schema::ResultSet;
use parent 'DBIx::Class::ResultSet';

__PACKAGE__->load_components(qw/
  Helper::ResultSet::IgnoreWantarray
  Helper::ResultSet::Me
  Helper::ResultSet::Random
  Helper::ResultSet::SetOperations
  Helper::ResultSet::ResultClassDWIM
  Helper::ResultSet::RemoveColumns
/);

sub hri {
  (shift)->
  search({}, {
	result_class => '::HashRefInflator',
  });
}

1;

=head1 NAME

Freestock::Schema::ResultSet - A base ResultSet Class

=head1 SYNOPSIS

    package OnlyInsults::Schema::ResultSet::User;
    use parent 'OnlyInsults::Schema::ResultSet';
	
=head1 DESCRIPTION

All ResultSet classes should inherit from this.  This provides some base
methods that you can share across all the resultsets.  Good things to put here
would include utilties useful for all resultsets and inflator classes.

Please see the documentation for  L<DBIx::Class::Helpers> in order to
understand included component functionality.

=head1 METHODS

This package defines the following methods.

=head2 hri

    my @array_of_hashrefs = $resultset->hri->all;

Returns a version of the current resultset which uses the alternative resultset
class L<DBIx::Class::ResultClass::HashRefInflator>.  This gives a nice,  clean
and fast dump of the current resultset data into a hash.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut

