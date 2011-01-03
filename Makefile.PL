#!/usr/bin/env perl

use strict;
use warnings FATAL =>'all';
use inc::Module::Install;

all_from 'lib/OnlyInsults.pm';

my @core = (
  'Plack' => '0.9960',
  'Plack::Middleware::Debug' => '0.10',
  'Plack::Middleware::Debug::DBIC::QueryLog' => '0.05',
  'Catalyst::Runtime' => '5.80029',
  'Catalyst::Engine::PSGI' => '0.11',
);

my @author = (
  'Catalyst::Devel' => '1.28',
  'MySQL::Sandbox' => '3.0.15',
);

push @core, @author
  if $Module::Install::AUTHOR;

requires @core;
test_requires 'Test::More' => '0.96';

require 'maint/Makefile.PL.include'
  if $Module::Install::AUTHOR;

WriteAll;
