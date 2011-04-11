package OnlyInsults::Web::Controller;

use Moose::Exporter;

use Moose ();
use Method::Signatures::Simple ();
use namespace::autoclean ();

my ($import, $unimport, $init_meta) =
  Moose::Exporter->build_import_methods( also => ['Moose'] );

sub modules_to_import {qw/method_signatures_simple namespace_autoclean/}

sub import {
  my ($class, @args) = @_;
  my $caller = caller;
  $class->${\"_import_$_"}($caller, @args)
    for $class->modules_to_import;
  goto $import;
}

sub unimport { goto $unimport }

sub init_meta {
  my ($class, @args) = @_;
  Moose->init_meta( @args, base_class => 'Catalyst::Controller::ActionRole' );
  goto $init_meta if $init_meta;
}

sub _import_method_signatures_simple {
  my ($class, $caller, @args) = @_;
  Method::Signatures::Simple->import(
    into => $caller,
    name => 'method',
    invocant => '$self',
  );
}

sub _import_namespace_autoclean {
  my ($class, $caller, @args) = @_;
  namespace::autoclean->import(
    -cleanee => $caller,
  );
}

1;

