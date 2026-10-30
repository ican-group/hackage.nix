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
      identifier = { name = "seihou-okf-extension"; version = "0.13.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/seihou";
      url = "";
      synopsis = "OKF documentation extension for Seihou registries";
      description = "External Seihou extension executable for generating OKF documentation bundles\nfrom Seihou registries. The initial package establishes the extension boundary;\nlater plans add registry loading, rendering, and the real docs command.";
      buildType = "Simple";
    };
    components = {
      sublibs = {
        "seihou-okf-extension-internal" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."okf-core" or (errorHandler.buildDepError "okf-core"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."seihou-core" or (errorHandler.buildDepError "seihou-core"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      exes = {
        "seihou-okf-extension" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."seihou-okf-extension".components.sublibs.seihou-okf-extension-internal or (errorHandler.buildDepError "seihou-okf-extension:seihou-okf-extension-internal"))
          ];
          buildable = true;
        };
      };
      tests = {
        "seihou-okf-extension-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."okf-core" or (errorHandler.buildDepError "okf-core"))
            (hsPkgs."seihou-core" or (errorHandler.buildDepError "seihou-core"))
            (hsPkgs."seihou-okf-extension".components.sublibs.seihou-okf-extension-internal or (errorHandler.buildDepError "seihou-okf-extension:seihou-okf-extension-internal"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hspec" or (errorHandler.buildDepError "tasty-hspec"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }