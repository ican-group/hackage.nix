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
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "cabal2spec"; version = "2.9.0"; };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "simons@cryp.to";
      author = "Peter Simons, Bryan O'Sullivan, Jens Petersen";
      homepage = "https://github.com/peti/cabal2spec";
      url = "";
      synopsis = "Convert Cabal files into rpm spec files";
      description = "Convert\nCabal files into a\n<http://ftp.rpm.org/max-rpm/s1-rpm-build-creating-spec-file.html spec file>\nsuitable for building the package with the RPM package manager. This\ntool primarily targets the <http://www.suse.com/ SUSE> and\n<http://www.opensuse.org openSUSE> familiy of distributions. Support\nfor other RPM-based distributions is currently not available. Check\nout <http://hackage.haskell.org/package/cabal-rpm cabal-rpm> if you\nneed this.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
        ];
        buildable = true;
      };
      exes = {
        "cabal2spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."cabal2spec" or (errorHandler.buildDepError "cabal2spec"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          ];
          buildable = true;
        };
      };
      tests = {
        "regression-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."cabal2spec" or (errorHandler.buildDepError "cabal2spec"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
          ];
          buildable = true;
        };
      };
    };
  }