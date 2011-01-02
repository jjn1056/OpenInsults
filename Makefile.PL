#!/usr/bin/env perl

use strict;
use warnings FATAL =>'all';
use inc::Module::Install 1.00;
all_from 'lib/OnlyInsults/Web.pm';

requires ''; ## Add project dependencies
test_requires 'Test::More' => '0.96';

require 'maint/Makefile.PL.include'
  if $Module::Install::AUTHOR;

WriteAll;
