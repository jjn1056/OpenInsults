package OnlyInsults::Schema::Result::Tag;

use DBIx::Class::Candy
  -base => 'OnlyInsults::Schema::Result';

table 'tag';

column tag_id => {
  data_type => 'varchar',
  size => '36',
};

column language_id => {
  data_type => 'varchar',
  size => '36',
};

column term => {
  data_type => 'varchar',
  size => '40',
};

column created => {
  data_type => 'datetime', 
  set_on_create => 1,
};

primary_key 'tag_id';
unique_constraint ['term'];

has_many videos_tag_rs => ('OnlyInsults::Schema::Result::VideoTag', 'video_id');
many_to_many videos => ('videos_tag_rs', 'video');

belongs_to language => ('OnlyInsults::Schema::Result::Language', 'language_id');

1;

=head1 NAME

OnlyInsults::Schema::Result::Tag - Information about a video tag

=head1 DESCRIPTION

A person or organization that created a video.  A video may have one or more
tag and each tag may be the source of one or more videos.

In many cases the tag and contributor will be one and the same.

=head1 COLUMNS

These are the fields in this source

=head2 tag_id

Primary key used to identify a tag for internal use.

=head2 language_id

FK to the Language table.  It is the language that the tag is in.

=head2 term

Tag name that is associated with a given video.

    * TODO: What about machine tags?

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
