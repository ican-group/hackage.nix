{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  {
    flags = { buildtests = false; };
    package = {
      specVersion = "1.24";
      identifier = { name = "takusen-oracle"; version = "0.10.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2003-2009, Alistair Bayley, Oleg Kiselyov, 2013, Pavel Ryzhov";
      maintainer = "paul@paulrz.cz";
      author = "Alistair Bayley, Oleg Kiselyov, Pavel Ryzhov";
      homepage = "https://github.com/paulrzcz/takusen-oracle.git";
      url = "https://github.com/paulrzcz/takusen-oracle.git";
      synopsis = "Database library with left-fold interface for Oracle.";
      description = "Takusen-Oracle is a Oracle access library. Like HSQL and HDBC, we support\narbitrary SQL statements (currently strings, extensible to anything\nthat can be converted to a string).\nIt is based on original Takusen library. It was just upgraded to support\nOracle 11gR2/12c instant client and GHC 7.4.2 and higher.";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.pkgsBuildBuild.base or (pkgs.pkgsBuildBuild.base or (errorHandler.setupDepError "base")))
        (hsPkgs.pkgsBuildBuild.Cabal or (pkgs.pkgsBuildBuild.Cabal or (errorHandler.setupDepError "Cabal")))
      ];
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
        ];
        libs = if system.isWindows
          then [ (pkgs."oci" or (errorHandler.sysDepError "oci")) ]
          else [ (pkgs."clntsh" or (errorHandler.sysDepError "clntsh")) ];
        buildable = true;
      };
      exes = {
        "takusen_tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
          ] ++ pkgs.lib.optional (!!flags.buildtests) (hsPkgs."takusen-oracle" or (errorHandler.buildDepError "takusen-oracle"));
          buildable = if !flags.buildtests then false else true;
        };
        "miniunit_tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ];
          buildable = if !flags.buildtests then false else true;
        };
      };
    };
  }