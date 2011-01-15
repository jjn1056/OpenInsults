package OnlyInsults::Schema::Result;
use parent 'DBIx::Class::Core';
use UUID::Tiny ':std';

__PACKAGE__->load_components(qw/
  Helper::Row::NumifyGet
  Helper::Row::JoinTable
  Helper::Row::OnColumnChange
  Helper::Row::StorageValues
  DynamicDefault
  TimeStamp
  InflateColumn::DateTime
/);

sub insert {
  my $self = shift;
  for my $column ($self->primary_columns) {
    $self->store_column($column, create_uuid_as_string())
      unless defined $self->get_column($column);
  }
  $self->next::method(@_);
}

1;

=head1 NAME

OnlyInsults::Schema::Result - The base result class

=head1 SYNOPSIS

	package OnlyInsults::Schema::Result::User;
    use parent 'OnlyInsults::Schema::Result';
	
=head1 DESCRIPTION

All Result classes will inherit from this.  This provides some base functions,
primarily from included components.  Please see the documentation for the
following components: L<DBIx::Class::Helpers>, L<DBIx::Class::DynamicDefault>,
L<DBIx::Class::Timestamp>, L<DBIx::Class::InflateColumn::DateTime>

=head1 ATTRIBUTES

This class defines the following attributes.

=head1 METHODS

This module defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut

