package OnlyInsults::Schema::Result::Creator;

use OnlyInsults::Schema::Candy;

table 'creator';

column creator_id => {
  data_type => 'varchar',
  size => '22',
};

column uri => {
  data_type => 'varchar',
  size => '196',
};

column note => {
  data_type => 'text',
};

primary_key 'creator_id';

has_many videos_creator_rs => ('::VideoCreator', 'creator_id');
many_to_many videos => ('videos_creator_rs', 'video');

1;

=head1 NAME

OnlyInsults::Schema::Result::Creator - Information about a video creator

=head1 DESCRIPTION

A person or organization that created a video.  A video may have one or more
creator and each creator may be the source of one or more videos.

In many cases the creator and contributor will be one and the same.

=head1 COLUMNS

These are the fields in this source

=head2 creator_id

Primary key used to identify a creator for internal use.

=head2 uri

URL/URI associated with the creator

=head2 note

placeholder information while I determine what a creator is (what fields
of information are needed).

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
