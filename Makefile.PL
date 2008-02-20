use strict;
use ExtUtils::MakeMaker;

unless ($^O eq "MSWin32" || $^O eq "cygwin") {
    die "OS unsupported\n";
}

my @libs;
push @libs, '-L/lib/w32api -lnetapi32' if $^O eq "cygwin";

WriteMakefile(
    'NAME'		=> 'Win32::NetAdmin',
    'VERSION_FROM'	=> 'NetAdmin.pm',
    'LIBS'		=> \@libs,
    'dist'		=> {COMPRESS => 'gzip -9f', SUFFIX => 'gz'},
    ($] < 5.005 ? () :
      (
	'AUTHOR'	=> 'Douglas Lankshear <dougl@ActiveState.com>',
	'ABSTRACT_FROM'	=> 'NetAdmin.pm',
      )),
);
