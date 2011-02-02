#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';
use Plack::Builder;
use OnlyInsults::Web;

builder {
  enable 'StackTrace';
  enable 'Debug', panels => OnlyInsults::Web->config->{debug_panels};
  OnlyInsults::Web->psgi_app;
};

