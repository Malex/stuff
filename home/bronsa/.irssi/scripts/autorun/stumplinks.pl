## mkshorterlink.pl -- Irssi interface for makeashorterlink.com
## (C) 2002 Gergely Nagy <algernon@bonehunter.rulez.org>
##
## Released under the GPLv2.
##
## ChangeLog:
## 0.1 -- Initial version
## 0.2 -- Added support for ignoring URLs matching certain regexps.
##        (Thanks to Ganneff for the idea)
## 0.3 -- Added help messages.

use Irssi qw();
use vars qw($VERSION %IRSSI);

$VERSION = "0.1";

sub stumplink {
	my ($server, $msg, $nick, $address, $target) = @_;
	if ($msg =~ /(http:\/\/[0-9A-Za-z._&?#=%\/~-]*)/) {
		`echo "\"$1\"" >> /tmp/stumplinks`}
}

Irssi::signal_add_last ('message public', 'stumplink');
