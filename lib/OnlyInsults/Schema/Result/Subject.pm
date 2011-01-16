package OnlyInsults::Schema::Result::Subject;

use DBIx::Class::Candy
  -base => 'OnlyInsults::Schema::Result';

table 'subject';

column subject_id => {
  data_type => 'varchar',
  size => '36',
};

column label => {
  data_type => 'varchar',
  size => '40'
};

column comment => {
  data_type => 'text',
};

primary_key 'subject_id';

has_many videos_subject_rs => ('OnlyInsults::Schema::Result::VideoSubject', 'video_id');
many_to_many videos => ('videos_subject_rs', 'video');

1;

=head1 NAME

OnlyInsults::Schema::Result::Subject - Information about a video subject

=head1 DESCRIPTION

Subject is a controlled list of terms used to categorize videos.

=head1 COLUMNS

These are the fields in this source

=head2 subject_id

Primary key used to identify a subject for internal use.

=head2 label

a constant style but human readable (and meaningful) tag for the subject.

=head2 comment

a blurb of useful information about the subject.  However this is not indented
for external viewers but for internal documentation purposes.

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
