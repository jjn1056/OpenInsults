#!/usr/bin/env perl

use strict;
use warnings FATAL =>'all';
use inc::Module::Install;

license 'restricted';
requires 'Moose';
requires 'Plack';
requires 'Plack::Middleware::Debug';
requires 'CatalystX::Declare';
requires 'Catalyst::Runtime';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Action::RenderView';

test_requires 'Test::Most' => '0.23';
test_requires 'Test::LeakTrace';
test_requires 'Test::Requires';

all_from 'lib/OnlyInsults.pm';
require 'maint/Makefile.PL.include'
  if $Module::Install::AUTHOR;

WriteAll;
