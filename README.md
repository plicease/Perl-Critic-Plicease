# Perl::Critic::Plicease ![linux](https://github.com/uperl/Perl-Critic-Plicease/workflows/linux/badge.svg) ![macos](https://github.com/uperl/Perl-Critic-Plicease/workflows/macos/badge.svg) ![windows](https://github.com/uperl/Perl-Critic-Plicease/workflows/windows/badge.svg) ![cygwin](https://github.com/uperl/Perl-Critic-Plicease/workflows/cygwin/badge.svg) ![msys2-mingw](https://github.com/uperl/Perl-Critic-Plicease/workflows/msys2-mingw/badge.svg)

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

Author: Graham Ollis <plicease@cpan.org>

Contributors:

Ville Skyttä (SCOP)

# COPYRIGHT AND LICENSE

This software is copyright (c) 2019-2024 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
