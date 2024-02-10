package Perl::Critic::Plicease;

use strict;
use warnings;
use 5.010001;

# ABSTRACT: Some Perl::Critic policies used by Plicease
# VERSION

=head1 DESCRIPTION

The L<Perl::Critic::Policy::Plicease> policies are an eclectic collection of
L<Perl::Critic> policies.  They aren't grouped into a theme because some are
application specific and you should review and include them only on a case by
case basis.

=over 4

=item L<Plicease::ProhibitLeadingZeros|Perl::Critic::Policy::Plicease::ProhibitLeadingZeros>

This is a slight remix on the prohibit leading zeros policy with some helpful exceptions.

=item L<Plicease::ProhibitUnicodeDigitInRegexp|Perl::Critic::Policy::Plicease::ProhibitUnicodeDigitInRegexp>

Prohibit C<\d> (match any digit) in regular expressions without the C</a> or C</u> modifier.

=back

=cut

1;
