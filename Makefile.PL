use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  'NAME'          => 'Prompt::Timeout',
  'ABSTRACT'      => 'prompt() with auto-selecting default value in case of inactivity',
  'AUTHOR'        => 'Serguei Trouchelle <stro@railways.dp.ua>',
  'VERSION_FROM'  => 'Timeout.pm',
  'LICENSE'       => 'perl',
  'PREREQ_PM'     => {
                       'Term::ReadKey' => 0,
                     },
);
