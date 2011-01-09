#!/usr/bin/env perl

use strict;
use warnings FATAL =>'all';
use inc::Module::Install;

requires 'Web::Simple';
requires 'Plack' => '0.9962',
requires 'Plack::Middleware::Debug' => '0.10';

test_requires 'Test::Most' => '0.23';

all_from 'lib/OnlyInsults.pm';
require 'maint/Makefile.PL.include'
  if $Module::Install::AUTHOR;

WriteAll;
