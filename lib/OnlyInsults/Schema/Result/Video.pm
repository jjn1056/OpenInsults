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
  size => '64',
};

column transcript => {
  data_type => 'text',
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

belongs_to language => ('OnlyInsults::Schema::Result::Language', 'language_id');

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

=head2 transcript

a textual representation of the words used in the video.

  * Hash tags are automatically extracted.
  

=head2 date

A date that is associated with the video

=head1 METHODS

This package defines the following methods.

=head1 TODO

    * Do we need 'coverage' or 'location'?
    * What if anything should 'date' mean?
    * should title/desc be m2m with language ids?
    * should m2m have required 'primary' value?
      for example primary_source_id, primary_tag_id

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
