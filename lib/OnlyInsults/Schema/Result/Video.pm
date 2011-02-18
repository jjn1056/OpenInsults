package OnlyInsults::Schema::Result::Video;

use DBIx::Class::Candy
  -base => 'OnlyInsults::Schema::Result';

table 'video';

column video_id => {
  data_type => 'varchar',
  size => '36',
};

column language_id => {
  data_type => 'varchar',
  size => '36',
};

column title => {
  data_type => 'varchar',
  size => '24',
};

column description => {
  data_type => 'varchar',
  size => '140',
};

column transcript => {
  data_type => 'text',
};

column status_id => {
  data_type => 'varchar',
  size => '36',
};

column date => {
  data_type => 'datetime',
};

primary_key 'video_id';

has_many video_contributors_rs => ('OnlyInsults::Schema::Result::VideoContributor', 'contributor_id');
many_to_many contributors => ('video_contributors_rs', 'contributor');

has_many video_creators_rs => ('OnlyInsults::Schema::Result::VideoCreator', 'creator_id');
many_to_many creators => ('video_creators_rs', 'creator');

has_many video_subjects_rs => ('OnlyInsults::Schema::Result::VideoSubject', 'subject_id');
many_to_many subjects => ('video_subjects_rs', 'subject');

has_many video_tags_rs => ('OnlyInsults::Schema::Result::VideoTag', 'tag_id');
many_to_many tags => ('video_tags_rs', 'tag');

has_many video_sources_rs => ('OnlyInsults::Schema::Result::VideoTag', 'tag_id');
many_to_many sources => ('video_tags_rs', 'tag');

has_many video_rights_rs => ('OnlyInsults::Schema::Result::VideoRight', 'right_id');
many_to_many rights => ('video_tags_rs', 'right');

belongs_to language => ('OnlyInsults::Schema::Result::Language', 'language_id');
belongs_to status => ('OnlyInsults::Schema::Result::Status', 'status_id');

1;

=head1 NAME

OnlyInsults::Schema::Result::Video - Video on the website

=head1 DESCRIPTION

This represents a video on the website.

=head1 COLUMNS

These are the fields in this source

=head2 video_id

Primary key for the source.

=head2 language_id

FK to the language table.

=head2 title

=head2 description

What the video is about.  Allows links bit converted to bitly.

  * supports Hash and @ tags (like tweets)

=head2 transcript

a textual representation of the words used in the video.

  * Hash tags are automatically extracted.

=head2 date

A date that is associated with the video.  For our purposes this will be the 
date the video was made available for the first time on our website.

=head1 METHODS

This package defines the following methods.

=head1 TODO

    * maybe 'Availability' isn't really the best way to describe this
    * work out rating system (for friendly thru adult viewers)
    * Work out commenting system
    * add all the generated / discovered metadata, such as size, length,
      thumbnail(s), etc.
    * Work out what to do with 'relation', perhaps this is a good way to group
      insults together (like 'is-reply-to', etc.)
    * should title/desc be m2m with language ids?
    * availability might need to be m2m
    * at some point need to think about 'rights' and 'visibility'.  For example
      maybe we could allow insults that only friends can see...
    * should m2m have required 'primary' value?
      for example primary_source_id, primary_tag_id

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
