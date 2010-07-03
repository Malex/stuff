#!/usr/bin/perl

use Irssi;
use vars qw($VERSION %IRSSI);
 
$VERSION = "0.01";

sub alert
{
	my ($dest, $text, $stripped) = @_;
	if (($dest->{level} & ( MSGLEVEL_HILIGHT|MSGLEVEL_MSGSMSGLEVEL_HILIGHT | MSGLEVEL_MSGS)) &&
		($dest->{level} & MSGLEVEL_NOHILIGHT) == 0)
		{
			
		my $group = `echo 'groups' | "/usr/bin/stumpish"`;
		if($group =~ /1\+/)
			{
				`echo "echo you have been named on irssi" | "/usr/bin/stumpish"`
			}
		}
}

Irssi::signal_add ('print text', 'alert' );

 

