package Perl::Critic::Policy::Plicease::ProhibitLeadingZeros;

use strict;
use warnings;
use 5.008004;
use Perl::Critic::Utils;
use base qw( Perl::Critic::Policy );

# ABSTRACT: Leading zeroes are okay as the first arg to chmod, and other such reasonableness
# VERSION

=head1 DESCRIPTION

This is a stupid mistake:

 my $x = 1231;
 my $y = 2345;
 my $z = 0032;

This is not:

 chmod 0700, "secret_file.txt";

Neither is this:

 use File::Path qw( mkpath );
 
 mkpath("/foo/bar/baz", 1, 0700);

Nor is this:

 use Path::Class qw( dir );
 
 dir()->mkpath(1,0700);

=head1 CAVEATS

Because C<mkpath> is not a built in (as C<chmod> is), this policy does not differentiate between the
C<mkpath> function provided by L<File::Path> or the C<mkpath> method provided by L<Path::Class::Dir>
and arbitrary C<mkpath> function or methods that you or someone else might define.  Also, there is
no way to really check if the object invocant of a C<mkpath> method is really an instance of
L<Path::Class::Dir>.

=head1 SEE ALSO

This policy is based largely on the existing in-core policy, and one in the lax bundle, but adds a
few exceptions that I find useful.

=over 4

=item L<Perl::Critic::Policy::ValuesAndExpressions::ProhibitLeadingZeros>

=item L<Perl::Critic::Policy::Lax::ProhibitLeadingZeros::ExceptChmod>

=back

=cut

my $DESCRIPTION = q{Integer with leading zeros outside of chmod, mkpath};
my $EXPLANATION = "Only use leading zeros on numbers indicating file modes";

sub default_severity { $SEVERITY_MEDIUM     }
sub default_themes   { ()                   }
sub applies_to       { 'PPI::Token::Number' }

sub violates
{
  my($self, $element, undef) = @_;

  return unless $element =~ m/\A [+-]? (?: 0+ _* )+ [1-9]/mx;
  return if $element->sprevious_sibling eq 'chmod';
  return if (eval { $element->sprevious_sibling->sprevious_sibling->sprevious_sibling->sprevious_sibling->sprevious_sibling }||'') eq 'mkpath';

  my $working = eval { $element->parent->parent };
  if($element->parent->isa('PPI::Statement::Expression'))
  {
    my $working = $element->parent->parent;
    while(eval { $working->isa('PPI::Structure::List') })
    {
      $working = $working->parent;
    }
    return if $working and ($working->children)[0] eq 'chmod';
    return if $working and ($working->children)[-3] eq 'mkpath';
  }

  return $self->violation($DESCRIPTION, $EXPLANATION, $element);
}

1;
