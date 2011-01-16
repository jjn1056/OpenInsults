#!/usr/bin/env perl

use OnlyInsults::Web;
use SQL::Translator;

SQL::Translator->new(
  parser => 'SQL::Translator::Parser::DBIx::Class',
  parser_args => {
    package => OnlyInsults::Web->model('Schema')->schema,
  },
  to => 'GraphViz',
  producer_args => {
    out_file => OnlyInsults::Web->path_to('share','docs','schema.png'),
    width => 16.0,
    height => 11.1,
    pagewidth => 16.2,
    pageheight => 11.3,
    show_constraints => 1,
    show_datatypes => 1,
    show_sizes => 1,
    layout => 'dot',
  },
)->translate;

