on 'runtime' => sub {
    requires 'perl' => '5.008001';
    requires 'strict';
    requires 'warnings';
    requires 'Exporter' => '5.57';
    requires 'DynaLoader';
    requires 'Win32';
};

on 'build' => sub {
    requires 'Config';
    requires 'ExtUtils::MakeMaker' => '7.12';
    requires 'Win32';
};

on 'configure' => sub {
    requires 'Config';
    requires 'ExtUtils::MakeMaker' => '7.12';
    requires 'Win32';
};

on 'test' => sub {
    requires 'strict';
    requires 'warnings';
    requires 'Test';
    requires 'Win32';
};

on 'develop' => sub {
    requires 'Dist::Zilla';
    requires 'Pod::Coverage::TrustPod';
    requires 'Test::CheckManifest' => '1.29';
    requires 'Test::CPAN::Changes' => '0.4';
    requires 'Test::CPAN::Meta';
    requires 'Test::Kwalitee'      => '1.22';
    requires 'Test::Pod::Coverage';
    requires 'Test::Pod::Spelling::CommonMistakes' => '1.000';
};