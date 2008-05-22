#!/usr/bin/env perl -w

use strict;
use Test;

BEGIN { plan tests => 3 }

use Prompt::Timeout;

$|=1;

print "# This test case's running time is 2 minutes. Use Ctrl-Break to break, Ctrl-C may not work.\n";

ok(prompt('Press <Enter> or wait 1 second. Do not press any other key!', 'DEF', 1, 1), 'DEF');
ok(prompt('Press <Enter> or wait 60 seconds. ', 'DEF'), 'DEF'); # 60 seconds to run!
ok(prompt('Press <Enter> or wait 60 seconds. '), '');           # 60 seconds to run!


exit;
