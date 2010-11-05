use strict;
use warnings;

# $Id: Makefile.PL 26 2010-11-05 12:39:20Z stro $

use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
    'NAME'              => 'Prompt::Timeout',
    'ABSTRACT'          => 'prompt() with auto-selecting default value in case of inactivity',
    'AUTHOR'            => 'Serguei Trouchelle <stro@cpan.org>',
    'VERSION_FROM'      => 'Timeout.pm',
    'LICENSE'           => 'perl',
    'PREREQ_PM'         => {
                            'Term::ReadKey' => 0,
                           },
    'BUILD_REQUIRES'    => {
                            'Test::Harness' => 3.21,
                            'Test::More'    => 0.94,
                           },
);

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
    my $br = delete $WriteMakefileArgs{'BUILD_REQUIRES'};
    my $pp = $WriteMakefileArgs{'PREREQ_PM'};
    foreach my $mod (keys %$br) {
        if (exists $pp->{$mod}) {
            $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
        } else {
            $pp->{$mod} = $br->{$mod};
        }
    }
}

WriteMakefile(%WriteMakefileArgs);