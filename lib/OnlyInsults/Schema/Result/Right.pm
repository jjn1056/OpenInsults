package OnlyInsults::Schema::Result::Right;

use OnlyInsults::Schema::Candy;

table 'right';

column right_id => {
  data_type => 'varchar',
  size => '22',
};

column clause => {
  data_type => 'varchar',
  size => '196',
};

primary_key 'right_id';

has_many videos_right_rs => ('::VideoRight', 'right_id');
many_to_many videos => ('videos_right_rs', 'video');

1;

=head1 NAME

OnlyInsults::Schema::Result::Right - Information about a video right

=head1 DESCRIPTION

Rights dictate some sort of intelectual property statement held about the video
in question.

=head1 COLUMNS

These are the fields in this source

=head2 right_id

Primary key used to identify a right for internal use.

=head2 clause

A human-readable statement about the rights held, the URI of a license ot some
sort of a machine-readable statement (or any combination thereof).

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
