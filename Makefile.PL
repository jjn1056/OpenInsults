#!/usr/bin/env perl

use strict;
use warnings FATAL =>'all';
use inc::Module::Install;

requires 'parent';
requires 'namespace::autoclean';
requires 'Text::Xslate';
requires 'Catalyst::Runtime';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Cache';
requires 'Catalyst::Plugin::Session';
requires 'Catalyst::Plugin::Session::Store::FastMmap';
requires 'Catalyst::Plugin::Session::State::Cookie';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Action::REST';
requires 'Catalyst::ActionRole::BuildDBICResult'; 
requires 'Catalyst::Model::DBIC::Schema';
requires 'Catalyst::Controller::ActionRole';
requires 'Catalyst::TraitFor::Model::DBIC::Schema::QueryLog::AdoptPlack';
requires 'Catalyst::View::CSS::Minifier::XS';
requires 'Catalyst::View::Xslate';
requires 'DBIx::Class';
requires 'DBIx::Class::Helpers';
requires 'DBIx::Class::DynamicDefault';
requires 'DBIx::Class::TimeStamp';
requires 'DBIx::Class::QueryLog';
requires 'DBIx::Class::Candy';
requires 'DBIx::Class::Cursor::Cached';
requires 'DBIx::Class::DeploymentHandler';
requires 'DBIx::Class::Schema::Loader';
requires 'DBIx::Class::Fixtures';
requires 'FFmpeg::Command';
requires 'Locale::Codes';
requires 'Moose';
requires 'Plack';
requires 'Plack::Middleware::Debug::DBIC::QueryLog';
requires 'Plack::Middleware::Debug';
requires 'Data::UUID::Base64URLSafe';
requires 'Method::Signatures::Simple';
requires 'Syntax::Feature::Method';
requires 'Text::Xslate::Bridge::TT2Like';
requires 'File::Spec';
requires 'File::HomeDir';

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
