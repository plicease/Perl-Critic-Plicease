package Perl::Critic::Policy::Plicease::ProhibitSpecificModules;

use strict;
use warnings;
use 5.008004;
use Perl::Critic::Utils qw( $SEVERITY_HIGH );
use base qw( Perl::Critic::Policy );

# ABSTRACT: Prohibit the use of specific modules or pragmas
# VERSION

sub supported_parameters
{
  return (
    {
      name        => 'illicit_modules',
      description => 'Modules that should not be allowed.',
      behavior    => 'string list',
    }
  );
}

sub default_severity { $SEVERITY_HIGH            }
sub default_themes   { ()                        }
sub applies_to       { 'PPI::Statement::Include' }

sub violates
{
  my($self, $elem) = @_;
  my @violations;

  my $module_name = $elem->module;
  if(defined $module_name && $self->{_illicit_modules}->{$module_name})
  {
    push @violations, $self->violation(
      "Used module $module_name",
      "Module $module_name should not be used.",
      $elem
    );
  }

  return @violations;
}

1;
