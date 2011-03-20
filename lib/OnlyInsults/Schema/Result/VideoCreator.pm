package OnlyInsults::Schema::Result::VideoCreator;

use OnlyInsults::Schema::Candy;

table 'video_creator';

column 'video_id' => {
  data_type => 'varchar',
  size => '22',
};

column 'creator_id' => {
  data_type => 'varchar',
  size => '22',
};

primary_key 'video_id', 'creator_id';
belongs_to video => ('::Video', 'video_id');
belongs_to creator => ('::Creator', 'creator_id');

1;

=head1 NAME

OnlyInsults::Schema::Result::VideoCreator - Video to Creator Join table

=head1 DESCRIPTION

Join table between Creator and Video entities.

=head1 COLUMNS

These are the fields in this source

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
