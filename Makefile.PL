#!/usr/bin/env perl

use strict;
use warnings FATAL =>'all';
use inc::Module::Install;

requires 'Moose';
requires 'Plack';
requires 'Plack::Middleware::Debug';
requires 'CatalystX::Declare';
requires 'Catalyst::Runtime';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Action::RenderView';

test_requires 'Test::Most' => '0.23';

all_from 'lib/OnlyInsults.pm';
require 'maint/Makefile.PL.include'
  if $Module::Install::AUTHOR;

WriteAll;
