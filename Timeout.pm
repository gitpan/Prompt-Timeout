# Prompt/Timeout.pm
#
# Copyright (c) 2008 Serguei Trouchelle. All rights reserved.
#
# This program is free software; you can redistribute it and/or modify it
# under the same terms as Perl itself.

# History:
#  1.00  2008/05/22 Initial revision

=head1 NAME

Prompt::Timeout - prompt() with auto-selecting default value in case of inactivity

=head1 SYNOPSIS

 use Prompt::Timeout;
 my $res = prompt ( $question, $default, $timeout );

=cut

package Prompt::Timeout;

use strict;
use warnings;

use Carp;
use Term::ReadKey;
require 5.006;
require Exporter;

our @EXPORT = qw(prompt);
our @ISA = qw(Exporter);

$Prompt::Timeout::VERSION = "1.00";

=head1 DESCRIPTION

This module provides only one function, prompt(), and it's exported by default.

=head2 prompt

 my $res = prompt ( $question, $default, $timeout );

Prints a $question and waits for the input.
If no keys are pressed during $timeout seconds, $default is assumed.
When pressing just Enter key, $default is assumed.
If prompt() detects that it is not running interactively, $default will be used without prompting too.

If you want to disable inactivity timer if any key is pressed during prompt(),
you can invoke it with another optional parameter:

 my $res = prompt ( $question, $default, $timeout, 1 );

Once a key is pressed, inactivity timer is disabled.

When $timeout vales is omitted, it assumes 60 seconds.

=cut 

sub prompt ($;$$$) {

  my ($mess, $def, $timeout, $click) = @_;

  $timeout = 60 unless $timeout;
  
  Carp::confess("prompt function called without an argument") 
      unless defined $mess;

  Carp::confess("timeout argument should be integer") 
      unless $timeout =~ /^\d+$/;

  my $isa_tty = -t STDIN && (-t STDOUT || !(-f STDOUT || -c STDOUT)) ;

  my $dispdef = defined $def ? "[$def] " : " ";
  $def = defined $def ? $def : "";

  local $|=1;
  local $\;
  print "$mess $dispdef:";

  my $ans = '';
  if (!$isa_tty && eof STDIN) {
    print "$def\n";
  } else {

    my $end = time + $timeout;

    ReadMode 4; # Turn off controls keys
    while (1) {
      my $key = ReadKey(1); # 1 sec
      if (defined $key) {
        last if $key eq "\r";
        $ans .= $key;
        print $key;
        $end = time + $timeout;
      } else {
        if ($end < time and not ($click and $ans ne '')) {
          $ans = $def;
          print "$def\n";
          last;
        }
      }
    }
    ReadMode 0; # Reset tty mode before exiting
  }
  return (!defined $ans || $ans eq '') ? $def : $ans;
}

=head1 AUTHOR

Serguei Trouchelle E<lt>F<stro@railways.dp.ua>E<gt>

FindBin::Real uses partial code from ExtUtils::MakeMaker module.

=head1 COPYRIGHT

Copyright (c) 2008 Serguei Trouchelle. All rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;