use 5.006;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'SoggyOnion',
    VERSION_FROM      => 'lib/SoggyOnion.pm',
    ABSTRACT_FROM     => 'lib/SoggyOnion.pm',
    AUTHOR            => 'Ian L. <ian>',
    INSTALLBIN        => 'bin',
    PL_FILES          => {
        'bin/soggyonion-install.PL' => 'bin/soggyonion-install',
        'bin/soggyonion.PL'         => 'bin/soggyonion'
    },
    EXE_FILES         => [qw(
        bin/soggyonion-install
        bin/soggyonion
    )],
    PREREQ_PM         => {qw(
        Cache::FileCache
        File::Basename
        File::Find::Rule
        File::Path
        Geo::Weather
        HTML::Entities
        HTML::Strip
        HTML::TokeParser
        IO::All
        IO::Scalar
        LWP::Simple
        Parallel::ForkManager
        Template
        Test::More
        XML::RSS
        YAML
        )},
    dist => {
        'PREOP'       => 'pod2text lib/SoggyOnion.pm >README',
    },
);

