#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';
use OnlyInsults::Web;
use Plack::Builder;

OnlyInsults::Web->setup_engine('PSGI');
builder {
    enable 'StackTrace';
    enable 'Debug', panels => OnlyInsults::Web->config->{debug_panels};
    sub { OnlyInsults::Web->run(@_) };
};

