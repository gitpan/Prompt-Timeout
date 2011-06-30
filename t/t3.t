#!/usr/bin/env perl -w

# $Id: t3.t 37 2011-06-30 06:53:16Z stro $

use strict;
use Test::More;

BEGIN { plan tests => 4 }

use Prompt::Timeout;

$|=1;

diag("This test case's running time is 2 minutes. Use Ctrl-Break to break, Ctrl-C may not work. Don't press any keys during testing run.");

my ($time, $res);

$time = time;
$res = prompt('Press <Enter> or wait 1 second. Do not press any other key!', 'DEF', 1, 1);
is($res, 'DEF', 'Default value with 1 sec timeout and timeout lock');
diag('prompt returned <', $res, '> in ', time - $time, ' seconds');

$time = time;
$res = prompt('Press <Enter> or wait 1 second. Do not press any other key!', 'DEF', 1);
is($res, 'DEF', 'Default value with 1 sec timeout');
diag('prompt returned <', $res, '> in ', time - $time, ' seconds');

diag('now wait for 2 minutes...');
$time = time;
$res = prompt('Press <Enter> or wait 60 seconds. ', 'DEF');
is($res, 'DEF', 'Default value with default timeout'); # 60 seconds to run!
diag('prompt returned <', $res, '> in ', time - $time, ' seconds');

diag('one minute left...');

$time = time;
$res = prompt('Press <Enter> or wait 60 seconds. ');
is($res, '', 'Default empty value with default timeout'); # 60 seconds to run!
diag('prompt returned <', $res, '> in ', time - $time, ' seconds');

exit;
