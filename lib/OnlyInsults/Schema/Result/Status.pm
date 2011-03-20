package OnlyInsults::Schema::Result::Status;

use OnlyInsults::Schema::Candy;

table 'status';

column status_id => {
  data_type => 'varchar',
  size => '22',
};

column name => {
  data_type => 'varchar',
  size => '40',
};

primary_key 'status_id';
unique_constraint ['name'];

has_many video_rs => ('::Video', 'status_id');

1;

=head1 NAME

OnlyInsults::Schema::Result::Status - Information about a video status

=head1 DESCRIPTION

A person or organization that created a video.  A video may have one or more
status and each status may be the source of one or more videos.

In many cases the status and contributor will be one and the same.

=head1 COLUMNS

These are the fields in this source

=head2 status_id

Primary key used to identify a status for internal use.

column name

fixed list of statuses (active blocked removed ... )

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
