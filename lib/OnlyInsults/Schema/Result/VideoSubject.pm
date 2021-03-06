package OnlyInsults::Schema::Result::VideoSubject;

use OnlyInsults::Schema::Candy;

table 'video_subject';

column 'video_id' => {
  data_type => 'varchar',
  size => '22',
};

column 'subject_id' => {
  data_type => 'varchar',
  size => '22',
};

primary_key 'video_id', 'subject_id';
belongs_to video => ('::Video', 'video_id');
belongs_to subject => ('::Subject', 'subject_id');

1;

=head1 NAME

OnlyInsults::Schema::Result::VideoSubject - Video to Subject Join table

=head1 DESCRIPTION

Join table between Subject and Video entities.

=head1 COLUMNS

These are the fields in this source

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
