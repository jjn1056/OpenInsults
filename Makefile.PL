#!/usr/bin/env perl

use strict;
use warnings FATAL =>'all';
use inc::Module::Install;

license 'restricted';
requires 'parent';
requires 'Moose';
requires 'Plack';
requires 'DBIx::Class';
requires 'DBIx::Class::Helpers';
requires 'DBIx::Class::DynamicDefault';
requires 'DBIx::Class::TimeStamp';
requires 'DBIx::Class::QueryLog';
requires 'DBIx::Class::Candy';
requires 'Plack::Middleware::Debug::DBIC::QueryLog';
requires 'Plack::Middleware::Debug';
requires 'CatalystX::Declare';
requires 'Catalyst::Runtime';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Model::DBIC::Schema';
requires 'Catalyst::TraitFor::Model::DBIC::Schema::QueryLog::AdoptPlack';

test_requires 'Test::Most';
test_requires 'Test::LeakTrace';
test_requires 'Test::Requires';

all_from 'lib/OnlyInsults.pm';
require 'maint/Makefile.PL.include'
  if $Module::Install::AUTHOR;

WriteAll;
