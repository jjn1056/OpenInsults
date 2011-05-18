package OnlyInsults::Web::Controller;

use strict;
use warnings FATAL => 'all';

use Moose ();
use Moose::Exporter;
use Method::Signatures::Simple ();
use namespace::autoclean ();
use Sub::Exporter ();
use warnings::illegalproto ();

my ($import, $unimport, $init_meta) =
  Moose::Exporter->build_import_methods( also => ['Moose'] );

sub imports {qw/method_signatures_simple namespace_autoclean syntax_action warnings_and_strict/}
sub exports {qw/conf_action conf make_immutable/}

sub import {
  my ($class, @args) = @_;
  my $caller = caller;

  $class->${\"_import_$_"}($caller, @args)
    for $class->imports;

  my $exporter = $class->export_functions($caller, @args);
  $class->$exporter($class->exports);

  goto $import;
}

sub export_functions {
  my ($class, $caller) = @_;
  Sub::Exporter::build_exporter({
    into_level => 1,
    exports => [
      map { $_ => $class->${\"_export_$_"}($caller) } $class->exports,
    ],
  });
}

sub _export_conf_action {
  my ($class, $caller) = @_;
  sub {
    my ($local_class, $exported, @args) = @_;
    sub {
      my ($action, %args) = @_;
      my $action_args = delete $args{ActionArgs};
      my @actions = ref $action ? @$action : ($action);
      $caller->config(
        actions => { $_ => \%args },
        $action_args ? (action_args => { $_ => $action_args }) : (),
      ) for @actions;
    };
  };
}

sub _export_conf {
  my ($class, $caller) = @_;
  sub {
    my ($local_class, $exported, %args) = @_;
    sub {
      my (%args) = @_;
      $caller->config(%args);
    };
  };
}

sub _export_make_immutable {
  my ($class, $caller) = @_;
  sub {
    my ($local_class, $exported, %args) = @_;
    sub {
      my (%args) = @_;
      $caller->meta->make_immutable;
    };
  };
}


sub unimport { goto $unimport }

sub init_meta {
  my ($class, @args) = @_;
  Moose->init_meta( @args, base_class => 'OnlyInsults::Web::Controller::Base' );
  goto $init_meta if $init_meta;
}

sub _import_warnings_and_strict {
  strict->import;
  warnings->import(FATAL => 'all');
}

sub _import_method_signatures_simple {
  my ($class, $caller, @args) = @_;
  Method::Signatures::Simple->import(
    into => $caller,
  );
}

sub _import_syntax_action {
  my ($class, $caller, @args) = @_;
  OnlyInsults::Web::Controller::Syntax::Action->import(
    into => $caller,
  );
}

sub _import_namespace_autoclean {
  my ($class, $caller, @args) = @_;
  namespace::autoclean->import(
    -cleanee => $caller,
  );
}

package OnlyInsults::Web::Controller::Base;

use Moose;

extends 'Catalyst::Controller::ActionRole';

around 'create_action', sub {
  my ($orig, $self, %args) = @_;

  ## Add the Method, needs MatchRequestMethod
  if(my $proto_method = delete $args{attributes}{PROTO_Method}) {
      $args{attributes}{Method} = $proto_method;
      push @{$args{attributes}->{Does}}, $self->_expand_role_shortname('MatchRequestMethod');
  }

  ## Add the QueryParms, needs QueryParameter
  if(my $proto_query_param = delete $args{attributes}{PROTO_QueryParam}) {
      $args{attributes}{QueryParam} = $proto_query_param;
      push @{$args{attributes}->{Does}}, $self->_expand_role_shortname('QueryParameter');
  }

  ## Add CaptureArgs ONLY if no type of arg is specified
  if(
      defined($args{attributes}{PROTO_CaptureArgs}) &&
      ! defined($args{attributes}{CaptureArgs}) &&
      ! defined($args{attributes}{Args})
  ) {
      my $capture_args = delete $args{attributes}{PROTO_CaptureArgs};
      $args{attributes}{CaptureArgs} = $capture_args;
  }

  ## Add Args() ONLY if no type of arg is specified
  if(
      defined($args{attributes}{PROTO_Args}) &&
      ! defined($args{attributes}{CaptureArgs}) &&
      ! defined($args{attributes}{Args})
  ) {
      my $args = delete $args{attributes}{PROTO_Args};
      $args{attributes}{Args} = $args;
  }

  ## TODO map PROTO_PathPart to Path or PathPart, deal with chain roots

  return $self->$orig(%args);
};

package OnlyInsults::Web::Controller::Syntax::Action;

use strict;
use warnings FATAL => 'all';
use Carp;

use parent q/Devel::Declare::MethodInstaller::Simple/;

sub import {
  my ($class, %opts) = @_;
  $opts{into} ||= caller;
  $opts{invocant} ||= '$self';
  $class->install_methodhandler(name => 'action', %opts);
}

sub parser {
  my $self = shift;
  $self->init(@_);
  $self->skip_declarator;

  my $name   = $self->strip_name;
  my $proto  = $self->strip_proto;
  my $attrs  = $self->strip_attrs;
  my @decl   = $self->parse_proto($proto);
  my $inject = $self->inject_parsed_proto(@decl);

  $inject = $self->scope_injector_call() . $inject if defined $name;
  $attrs .= $self->generate_attrs($proto) if $proto;

  $self->inject_if_block($inject, $attrs ? "sub ${attrs} " : '');
  $self->install($name);

  return;
}

sub generate_attrs {
  my ($self, $proto) = @_;
  my (@method, $path_part, @path, $is_link, $is_slurpy, @query );

  METHOD: {
    $proto=~s/^\s*([GOP][A-Z\+]+)\s//;
    @method = $1 ? map { $_=~s{^\s+|\s+$}{}g; $_; } split '\+', $1 : ();
  }

  PATH_QUERY: {
    my ($path, $query) = split '\?', $proto;
    @path = $path ? map { $_=~s{^\s+|\s+$}{}g; $_; } split '\/|,', $path : ();
    $path_part = $path[0] && $path[0] !~ m/^\$|\./ ? shift @path : '""';
    $is_link = $path[-1] && $path[-1] eq '...' ? pop @path : '';
    $is_slurpy = $path[-1] && $path[-1] eq '*' ? pop @path : '';
    @query = $query ? map { $_=~s{^\s+|\s+$}{}g; $_; } split '\;', $query : ();
  }

  my @attrs = ("PROTO($proto)");
  push @attrs, "PROTO_Method($_)" for @method;
  push @attrs, "PROTO_PathPart($path_part)";
  push @attrs, "PROTO_QueryParam($_)" for @query;

  my $args;
  if($is_slurpy) {
    $args = "PROTO_Args";
  } elsif($is_link) {
    $args = "PROTO_CaptureArgs(".scalar(@path).")";
  } else {
    $args = "PROTO_Args(".scalar(@path).")";
  }

  push @attrs, $args if $args;
  return join '', map { ":$_ "} @attrs;
}

sub parse_proto {
  my $self = shift;
  my ($proto) = @_;
  $proto ||= '';
  $proto =~ s/[\r\n]//g;
  my $invocant = $self->{invocant};
  my $context = '$ctx';

  $invocant = $1
    if $proto =~ s{^(\$\w+):\s*}{};

  my ($args,$query) = split('\?', $proto);
  $args=~s/^\s*([GOP][A-Z\+]+)\s// if defined $args;
  my @inject = map { "$_; " }
    "my ${invocant} = shift",
    "my ${context} = shift",
    'my $log = '. $context. '->log',
    'my $req = '. $context. '->req',
    'my $res = '. $context. '->res';

  if($query) {
    my @q = split /[;\&]/, $query;
    for my $q (@q) {
      $q=~s/:.+$//;
      push @inject,
        'my $'.$q.' = $req->query_parameters->{'.$q.'};';
    }
  }

  ## Clean up the args, could probably come in clean from above if
  ## properly refactored.
  if($args) {
    $args =~s/\//,/g;
    $args =~s/\.\.\.$//;
    $args =~s/\*$//;
  }
  if(defined $args and length $args) {
    my $injection = "my ($args) = \@_;";
    TEST: {
      local $@;
      eval "$injection; 1"
        || Carp::croak "Malformed Argument Declaration '$injection', got $@";
    }
    push @inject, $injection;
  }

  return join '', @inject;
}

1;

