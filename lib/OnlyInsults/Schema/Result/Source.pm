package OnlyInsults::Schema::Result::Source;

use DBIx::Class::Candy
  -base => 'OnlyInsults::Schema::Result';

table 'source';

column source_id => {
  data_type => 'varchar',
  size => '36',
};

column uri => {
  data_type => 'varchar',
  size => '196',
};

column note => {
  data_type => 'text',
};

primary_key 'source_id';

has_many videos_source_rs => ('OnlyInsults::Schema::Result::VideoSource', 'video_id');
many_to_many videos => ('videos_source_rs', 'video');

1;

=head1 NAME

OnlyInsults::Schema::Result::Source - Information about a video source

=head1 DESCRIPTION

Source tells us about where the video came from.

=head1 COLUMNS

These are the fields in this source

=head2 source_id

Primary key used to identify a source for internal use.

=head2 uri

URL/URI associated with the creator.

=head2 note

Placeholder info until we really understand the requirement.

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
