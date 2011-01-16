package OnlyInsults::Schema::Result::Contributor;

use DBIx::Class::Candy
  -base => 'OnlyInsults::Schema::Result';

table 'contributor';

column contributor_id => {
  data_type => 'varchar',
  size => '36',
};

column note => {
  data_type => 'text',
};

primary_key 'contributor_id';

has_many videos_contributor_rs => ('OnlyInsults::Schema::Result::VideoContributor', 'video_id');
many_to_many videos => ('videos_contributor_rs', 'video');

1;

=head1 NAME

OnlyInsults::Schema::Result::Contributor - Information about a video contributor

=head1 DESCRIPTION

A person or organization that contributed a video.  A video may have one or more
contributors and each contributor may be the source of one or more videos

=head1 FIELDS

These are the fields in this source

=head2 contributor_id

Primary key used to identify a contributor for internal use.

=head2 note

placeholder information while I determine what a contributor is (what fields
of information are needed).

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
