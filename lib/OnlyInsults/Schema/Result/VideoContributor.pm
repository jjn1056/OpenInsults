package OnlyInsults::Schema::Result::VideoContributor;

use OnlyInsults::Schema::Candy;

table 'video_contributor';

column 'video_id' => {
  data_type => 'varchar',
  size => '22',
};

column 'contributor_id' => {
  data_type => 'varchar',
  size => '22',
};

primary_key 'video_id', 'contributor_id';
belongs_to video => ('::Video', 'video_id');
belongs_to contributor => ('::Contributor', 'contributor_id');

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
