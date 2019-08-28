use Config qw(%Config);
require Win32;

unless ($^O eq "MSWin32" || $^O eq "cygwin") {
    die "OS unsupported\n";
}

my %xsbuild = (
    XSMULTI => 1,
);
$xsbuild{LIBS} = ['-L/lib/w32api -lnetapi32'] if $^O eq "cygwin";