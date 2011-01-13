#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';
use Plack::Builder;
use OnlyInsults::Web;

OnlyInsults::Web->setup_engine('PSGI');

builder {
  enable 'StackTrace';
  enable 'Debug', panels => OnlyInsults::Web->config->{debug_panels};
  sub { OnlyInsults::Web->run(@_) };
};

