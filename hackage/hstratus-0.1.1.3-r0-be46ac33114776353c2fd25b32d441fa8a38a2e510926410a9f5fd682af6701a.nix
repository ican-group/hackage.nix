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
      specVersion = "3.0";
      identifier = { name = "hstratus"; version = "0.1.1.3"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2026 Tim Emiola";
      maintainer = "Tim Emiola <adetokunbo@emio.la>";
      author = "Tim Emiola";
      homepage = "";
      url = "";
      synopsis = "Unified CLI for iCloud services";
      description = "An @hstratus@ executable that provides subcommands for iCloud authentication,\nDrive, and Notes.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."hstratus-auth" or (errorHandler.buildDepError "hstratus-auth"))
          (hsPkgs."hstratus-drive" or (errorHandler.buildDepError "hstratus-drive"))
          (hsPkgs."hstratus-notes" or (errorHandler.buildDepError "hstratus-notes"))
          (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
        ];
        buildable = true;
      };
      exes = {
        "hstratus" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hstratus" or (errorHandler.buildDepError "hstratus"))
          ];
          buildable = true;
        };
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."benri-hspec" or (errorHandler.buildDepError "benri-hspec"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hstratus" or (errorHandler.buildDepError "hstratus"))
            (hsPkgs."hstratus-auth" or (errorHandler.buildDepError "hstratus-auth"))
            (hsPkgs."hstratus-drive" or (errorHandler.buildDepError "hstratus-drive"))
            (hsPkgs."hstratus-notes" or (errorHandler.buildDepError "hstratus-notes"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
      };
    };
  }