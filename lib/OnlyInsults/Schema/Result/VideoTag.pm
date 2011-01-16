package OnlyInsults::Schema::Result::VideoTag;

use DBIx::Class::Candy
  -base => 'OnlyInsults::Schema::Result';

join_table {
  left_class   => 'Video',
  left_method  => 'video',
  right_class  => 'Tag',
  right_method => 'tag',
};

1;

=head1 NAME

OnlyInsults::Schema::Result::VideoTag - Video to Tag Join table

=head1 DESCRIPTION

Join table between Tag and Video entities.

=head1 COLUMNS

These are the fields in this source

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
