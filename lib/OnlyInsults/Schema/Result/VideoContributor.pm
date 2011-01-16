package OnlyInsults::Schema::Result::VideoContributor;

use DBIx::Class::Candy
  -base => 'OnlyInsults::Schema::Result';

join_table {
  left_class   => 'Video',
  left_method  => 'video',
  right_class  => 'Contributor',
  right_method => 'contributor',
};

1;

=head1 NAME

OnlyInsults::Schema::Result::VideoContributor - Video to Contributor Join table

=head1 DESCRIPTION

Join table between Contributor and Video entities.

=head1 COLUMNS

These are the fields in this source

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
