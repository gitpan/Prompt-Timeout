#!/usr/bin/env perl -w

# $Id: t3.t 26 2010-11-05 12:39:20Z stro $

use strict;
use Test::More;

BEGIN { plan tests => 4 }

use Prompt::Timeout;

$|=1;

print STDERR "# This test case's running time is 2 minutes. Use Ctrl-Break to break, Ctrl-C may not work. Don't press any keys during testing run.\n";

is(prompt('Press <Enter> or wait 1 second. Do not press any other key!', 'DEF', 1, 1), 'DEF', 'Default value with 1 sec timeout and timeout lock');
is(prompt('Press <Enter> or wait 1 second. Do not press any other key!', 'DEF', 1), 'DEF', 'Default value with 1 sec timeout');
is(prompt('Press <Enter> or wait 60 seconds. ', 'DEF'), 'DEF', 'Default value with default timeout'); # 60 seconds to run!
print STDERR "# One minute left.\n";
is(prompt('Press <Enter> or wait 60 seconds. '), '', 'Default empty value with default timeout'); # 60 seconds to run!

exit;
