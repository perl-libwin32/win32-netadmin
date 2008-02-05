use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'Win32::NetAdmin',
    'VERSION_FROM' => 'NetAdmin.pm', # finds $VERSION
    'dist'	=> {COMPRESS => 'gzip -9f', SUFFIX => 'gz'},
    'dynamic_lib' => { 'OTHERLDFLAGS' => q[netapi32.lib] },
#    'INC'	=> '-I.\\include',
);
