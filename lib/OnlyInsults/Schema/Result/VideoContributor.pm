package OnlyInsults::Schema::Result::VideoContributor;

use DBIx::Class::Candy
  -base => 'OnlyInsults::Schema::Result';

table 'video_contributor';

column 'video_id' => {
  data_type => 'varchar',
  size => '36',
};

column 'contributor_id' => {
  data_type => 'varchar',
  size => '36',
};

primary_key 'video_id', 'contributor_id';
belongs_to video => ('OnlyInsults::Schema::Result::Video', 'video_id');
belongs_to contributor => ('OnlyInsults::Schema::Result::Contributor', 'contributor_id');

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
