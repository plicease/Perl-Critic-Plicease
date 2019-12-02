# Perl::Critic::Plicease [![Build Status](https://secure.travis-ci.org/plicease/Perl-Critic-Plicease.png)](http://travis-ci.org/plicease/Perl-Critic-Plicease)

Some Perl::Critic policies used by Plicease

# DESCRIPTION

The [Perl::Critic::Policy::Plicease](https://metacpan.org/pod/Perl::Critic::Policy::Plicease) policies are an eclectic collection of
[Perl::Critic](https://metacpan.org/pod/Perl::Critic) policies.  They aren't grouped into a theme because some are
application specific and you should review and include them only on a case by
case basis.

- [Plicease::ProhibitLeadingZeros](https://metacpan.org/pod/Perl::Critic::Policy::Plicease::ProhibitLeadingZeros)

    This is a slight remix on the prohibit leading zeros policy with some helpful exceptions.

- [Plicease::ProhibitUnicodeDigitInRegexp](https://metacpan.org/pod/Perl::Critic::Policy::Plicease::ProhibitUnicodeDigitInRegexp)

    Prohibit `\d` (match any digit) in regular expressions without the `/a` or `/u` modifier.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2019 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
