use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'	=> 'Win32::NetAdmin',
    'VERSION_FROM' => 'NetAdmin.pm',
    'dist'	=> {COMPRESS => 'gzip -9f', SUFFIX => 'gz'},
#    'INC'	=> '-I.\\include',
);
