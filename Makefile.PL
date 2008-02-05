use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'		=> 'Win32::NetAdmin',
    'VERSION_FROM'	=> 'NetAdmin.pm',
    'dist'		=> {COMPRESS => 'gzip -9f', SUFFIX => 'gz'},
    ($] < 5.005 ? () :
      (
	'AUTHOR'	=> 'Douglas Lankshear <dougl@ActiveState.com>',
	'ABSTRACT_FROM'	=> 'NetAdmin.pm',
      )),
);
