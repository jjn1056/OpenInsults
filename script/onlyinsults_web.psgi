#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';

use Plack::Builder;
use Plack::App::Directory;
use OnlyInsults::Web;

builder {
  mount '/static', builder {
    Plack::App::Directory
      ->new(root => OnlyInsults::Web->path_to('share','static'))
      ->to_app;
  },
  mount '/', builder {
    enable 'StackTrace';
    enable 'Debug', panels => OnlyInsults::Web->config->{debug_panels};
    OnlyInsults::Web->psgi_app;
  };
};

