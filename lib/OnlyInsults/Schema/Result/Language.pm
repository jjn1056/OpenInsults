package OnlyInsults::Schema::Result::Language;

use OnlyInsults::Schema::Candy;

table 'language';

column language_id => {
  data_type => 'varchar',
  size => '22',
};

column code_alpha2 => {
  data_type => 'char',
  size => '2',
};

primary_key 'language_id';

unique_constraint ['code_alpha2'];

has_many tags => ('::Tag', 'language_id');
has_many videos => ('::Video', 'language_id');

1;

=head1 NAME

OnlyInsults::Schema::Result::Language - Information about a video language

=head1 DESCRIPTION

A person or organization that created a video.  A video may have one or more
language and each language may be the source of one or more videos.

In many cases the language and contributor will be one and the same.

=head1 COLUMNS

These are the fields in this source

=head2 language_id

Primary key used to identify a language for internal use.

=head2 code_alpha2

two letter language code

=head1 METHODS

This package defines the following methods.

=head1 AUTHOR

See L<OnlyInsults> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<OnlyInsults> for rights information.

=cut
