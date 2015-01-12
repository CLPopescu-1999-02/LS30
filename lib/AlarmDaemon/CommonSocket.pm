#!/usr/bin/env perl
#   Copyright (C) 2010-2014, Nick Andrew <nick@nick-andrew.net>
#   Licensed under the terms of the GNU General Public License, Version 3
#
#   Common code for sockets - abstract superclass

=head1 NAME

AlarmDaemon::CommonSocket - abstract Socket superclass

=head1 DESCRIPTION

This class contains methods common to all the Socket classes

=head1 METHODS

=over

=cut

use strict;
use warnings;

package AlarmDaemon::CommonSocket;


# ---------------------------------------------------------------------------

=item I<socket()>

Return a reference to our socket.

=cut

sub socket {
	my ($self) = @_;

	return $self->{socket};
}


# ---------------------------------------------------------------------------

=item I<send($buffer)>

If connected, send data to our socket.

=cut

sub send {
	my ($self, $buffer) = @_;

	if ($self->{socket}) {
		$self->{socket}->send($buffer);
	}
}


# ---------------------------------------------------------------------------

=item I<peerhost()>

Return the text representation of the peer host address.

=cut

sub peerhost {
	my $self = shift;

	if ($self->{socket}) {
		return $self->{socket}->peerhost();
	}

	return undef;
}

=back

=cut

1;
