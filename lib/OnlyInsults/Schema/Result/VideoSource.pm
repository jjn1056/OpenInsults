package OnlyInsults::Schema::Result::VideoSource;

use DBIx::Class::Candy
  -base => 'OnlyInsults::Schema::Result';

table 'video_source';

column 'video_id' => {
  data_type => 'varchar',
  size => '36',
};

column 'source_id' => {
  data_type => 'varchar',
  size => '36',
};

primary_key 'video_id', 'source_id';
belongs_to video => ('OnlyInsults::Schema::Result::Video', 'video_id');
belongs_to source => ('OnlyInsults::Schema::Result::Source', 'source_id');

1;

=head1 NAME

OnlyInsults::Schema::Result::VideoSource - Video to Source Join table

=head1 DESCRIPTION

Join table between Source and Video entities.

=head1 COLUMNS

These are the fields in this source

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
