package OnlyInsults::Schema::Result::VideoTag;

use DBIx::Class::Candy
  -base => 'OnlyInsults::Schema::Result';

table 'video_tag';

column 'video_id' => {
  data_type => 'varchar',
  size => '36',
};

column 'tag_id' => {
  data_type => 'varchar',
  size => '36',
};

primary_key 'video_id', 'tag_id';
belongs_to video => ('OnlyInsults::Schema::Result::Video', 'video_id');
belongs_to tag => ('OnlyInsults::Schema::Result::Tag', 'tag_id');

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
