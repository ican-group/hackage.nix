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
    flags = { lint = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "hasql-check-ghc"; version = "0.5.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Kronor";
      maintainer = "lorenzo@kronor.io, pranay.sashank@kronor.io";
      author = "Pranay Sashank, Jose Lorenzo Rodriguez";
      homepage = "https://github.com/kronor-io/hasql-check";
      url = "";
      synopsis = "Check inferred hasql statements with what GHC knows of their types";
      description = "The types of a statement of Hasql.Check.Inferred.TH are only known once GHC\nhas type-checked its module. This package gets them from GHC in two ways:\n.\n* Hasql.Check.Plugin, a GHC plugin that checks the statements against a\ndatabase while their module compiles, making a statement that does not\nfit the schema a compile error at its quote.\n.\n* hasql-check-hie, which reads them from the .hie files GHC writes with\n-fwrite-ide-info, for hasql-check --inferred. It needs no database, so it\ncan run inside a sandboxed build.\n.\nBoth depend on GHC's own library: build them with the GHC the checked\nproject is built with.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."hasql-check" or (errorHandler.buildDepError "hasql-check"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      exes = {
        "hasql-check-hie" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."hasql-check-ghc" or (errorHandler.buildDepError "hasql-check-ghc"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      tests = {
        "hasql-check-ghc-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hasql-check-ghc" or (errorHandler.buildDepError "hasql-check-ghc"))
          ];
          buildable = true;
        };
        "hasql-check-plugin-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hasql-check-ghc" or (errorHandler.buildDepError "hasql-check-ghc"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          ];
          buildable = true;
        };
      };
    };
  }