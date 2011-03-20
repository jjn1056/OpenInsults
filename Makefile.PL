#!/usr/bin/env perl

use strict;
use warnings FATAL =>'all';
use inc::Module::Install;

requires 'parent';
requires 'CatalystX::Declare';
requires 'Catalyst::Runtime';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Model::DBIC::Schema';
requires 'Catalyst::TraitFor::Model::DBIC::Schema::QueryLog::AdoptPlack';
requires 'DBIx::Class';
requires 'DBIx::Class::Helpers';
requires 'DBIx::Class::DynamicDefault';
requires 'DBIx::Class::TimeStamp';
requires 'DBIx::Class::QueryLog';
requires 'DBIx::Class::Candy';
requires 'FFmpeg::Command';
requires 'Locale::Codes';
requires 'Moose';
requires 'Plack';
requires 'Plack::Middleware::Debug::DBIC::QueryLog';
requires 'Plack::Middleware::Debug';
requires 'Data::UUID::Base64URLSafe';

test_requires 'DateTime';
test_requires 'Test::Most';
test_requires 'Test::LeakTrace';
test_requires 'Test::Requires';
test_requires 'Test::DBIx::Class';

license 'restricted';
all_from 'lib/OnlyInsults.pm';
require 'maint/Makefile.PL.include'
  if $Module::Install::AUTHOR;

WriteAll;
