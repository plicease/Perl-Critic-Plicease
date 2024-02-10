package Perl::Critic::Policy::Plicease::ProhibitSpecificModules;

use strict;
use warnings;
use 5.010001;
use Perl::Critic::Utils qw( $SEVERITY_HIGH );
use base qw( Perl::Critic::Policy );

# ABSTRACT: Prohibit the use of specific modules or pragmas
# VERSION

=head1 SYNOPSIS

perlcriticrc:

 [Plicease::ProhibitSpecificModules]
 illicit_modules = Foo Bar

code:

 use Foo; # not ok
 use Bar; # not ok
 use Baz; # ok

=head1 DESCRIPTION

The policy L<Perl::Critic::Policy::Community::DiscouragedModules>
provides a good start for modules that typically should not be used
in new code, however for specific organizational policies, you may
want to disallow specific modules.  This policy has been designed
to allow you to do exactly that without any "starter" disallowed
modules.

=head1 AFFILIATION

None.

=head1 CONFIGURATION

=over 4

=item * illicit_modules

Space separated list of modules that should be disallowed.

=back

The policy is also configurable with the standard options.

=cut

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
