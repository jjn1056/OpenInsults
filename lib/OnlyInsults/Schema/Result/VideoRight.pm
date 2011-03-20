package OnlyInsults::Schema::Result::VideoRight;

use OnlyInsults::Schema::Candy;

table 'video_right';

column 'video_id' => {
  data_type => 'varchar',
  size => '22',
};

column 'right_id' => {
  data_type => 'varchar',
  size => '22',
};

primary_key 'video_id', 'right_id';
belongs_to video => ('::Video', 'video_id');
belongs_to right => ('::Right', 'right_id');

1;

=head1 NAME

OnlyInsults::Schema::Result::VideoRight - Video to Right Join table

=head1 DESCRIPTION

Join table between Right and Video entities.

=head1 COLUMNS

These are the fields in this source

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
