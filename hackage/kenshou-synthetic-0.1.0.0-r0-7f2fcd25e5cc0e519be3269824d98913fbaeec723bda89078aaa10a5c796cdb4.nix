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
      identifier = { name = "kenshou-synthetic"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/kenshou";
      url = "";
      synopsis = "Synthetic reference suite and the standalone kenshou executable";
      description = "The kenshou executable assembled from the generic operator commands and the\nharness's own self-test bundles.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."kenshou-check" or (errorHandler.buildDepError "kenshou-check"))
          (hsPkgs."kenshou-cli" or (errorHandler.buildDepError "kenshou-cli"))
          (hsPkgs."kenshou-core" or (errorHandler.buildDepError "kenshou-core"))
          (hsPkgs."kenshou-diagnose" or (errorHandler.buildDepError "kenshou-diagnose"))
          (hsPkgs."kenshou-measure" or (errorHandler.buildDepError "kenshou-measure"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."pg-migrate" or (errorHandler.buildDepError "pg-migrate"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
        ];
        buildable = true;
      };
      exes = {
        "kenshou" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."kenshou-cli" or (errorHandler.buildDepError "kenshou-cli"))
            (hsPkgs."kenshou-synthetic" or (errorHandler.buildDepError "kenshou-synthetic"))
          ];
          buildable = true;
        };
      };
    };
  }