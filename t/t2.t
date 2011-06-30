#!/usr/bin/env perl -w

# $Id: t2.t 37 2011-06-30 06:53:16Z stro $

use strict;
use Test::More;

BEGIN { plan tests => 1 }

use Prompt::Timeout;

my $time = time;
my $res = prompt('Press <Enter> or wait 1 second', 'DEF', 1);

diag('prompt returned <', $res, '> in ', time - $time, ' seconds');

is($res, 'DEF', 'Default value');

exit;
