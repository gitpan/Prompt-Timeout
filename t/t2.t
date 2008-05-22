#!/usr/bin/env perl -w

use strict;
use Test;

BEGIN { plan tests => 1 }

use Prompt::Timeout;

my $res = prompt('Press <Enter> or wait 1 second', 'DEF', 1);

ok($res, 'DEF');

exit;
