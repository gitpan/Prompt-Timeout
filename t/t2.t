#!/usr/bin/env perl -w

# $Id: t2.t 26 2010-11-05 12:39:20Z stro $

use strict;
use Test::More;

BEGIN { plan tests => 1 }

use Prompt::Timeout;

my $res = prompt('Press <Enter> or wait 1 second', 'DEF', 1);

is($res, 'DEF', 'Default value');

exit;
