
use strict;
use warnings;

use 5.009005;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Convert TBX-Basic data into TBX-Min\r",
  "AUTHOR" => "BYU Translation Research Group <akmtrg\@byu.edu>",
  "BUILD_REQUIRES" => {
    "Module::Build" => "0.3601"
  },
  "CONFIGURE_REQUIRES" => {
    "Module::Build" => "0.3601"
  },
  "DISTNAME" => "Convert-TBX-Basic",
  "EXE_FILES" => [
    "bin/basic2min"
  ],
  "LICENSE" => "perl",
  "NAME" => "Convert::TBX::Basic",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Exporter::Easy" => 0,
    "Log::Any" => 0,
    "Log::Any::Adapter" => 0,
    "Path::Tiny" => 0,
    "TBX::Min" => "0.06",
    "Try::Tiny" => 0,
    "XML::Twig" => 0,
    "autodie" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Capture::Tiny" => 0,
    "Data::Section::Simple" => 0,
    "Devel::FindPerl" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "FindBin" => 0,
    "Log::Any::Test" => 0,
    "Test::Base" => 0,
    "Test::Exception" => 0,
    "Test::LongString" => 0,
    "Test::More" => "0.88",
    "Test::NoWarnings" => 0,
    "Test::XML" => 0
  },
  "VERSION" => "0.02",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



