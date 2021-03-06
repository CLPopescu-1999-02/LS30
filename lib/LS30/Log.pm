#!/usr/bin/env perl
#   Copyright (C) 2010-2014, Nick Andrew <nick@nick-andrew.net>
#   Licensed under the terms of the GNU General Public License, Version 3

=head1 NAME

LS30::Log

=head1 DESCRIPTION

Useful logging functions.

=head1 METHODS

=over

=cut

package LS30::Log;

use strict;
use warnings;

use Date::Format qw(time2str);


# ---------------------------------------------------------------------------

=item I<logFormat($string)>

Format a supplied string:

  - Make CR and LF visible
  - Prefix with current date and time
  - Append a newline.

Return the formatted string.

=cut

sub logFormat {
	my ($string) = @_;

	my $now = time();

	$string =~ s/\\/\\\\/sg;
	$string =~ s/\r/\\r/sg;
	$string =~ s/\n/\\n/sg;
	return time2str('%Y-%m-%d %T ', $now) . $string . "\n";
}


# ---------------------------------------------------------------------------

=item I<timePrint($string)>

Format the supplied string in the logging format then print to STDERR.

=cut

sub timePrint {
	my ($string) = @_;

	print STDERR logFormat($string);
}


# ---------------------------------------------------------------------------

=item I<debug($string)>

If debugging is enabled, then format and print the string.

=cut

sub debug {
	my ($string) = @_;

	if ($ENV{LS30_DEBUG} && defined $string) {
		print STDERR logFormat($string);
	}
}


# ---------------------------------------------------------------------------

=item I<error($string)>

Format and print an error string.

=cut

sub error {
	my ($string) = @_;

	if (defined $string) {
		print STDERR logFormat('Error: ' . $string);
	}
}

=back

=cut

1;
