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
      identifier = { name = "kenshou-cli"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "https://github.com/shinzui/kenshou";
      url = "";
      synopsis = "Operator command library for the Kenshou verification harness";
      description = "Operator and automation interface for the Kenshou verification harness.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."githash" or (errorHandler.buildDepError "githash"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."kenshou-check" or (errorHandler.buildDepError "kenshou-check"))
          (hsPkgs."kenshou-core" or (errorHandler.buildDepError "kenshou-core"))
          (hsPkgs."kenshou-diagnose" or (errorHandler.buildDepError "kenshou-diagnose"))
          (hsPkgs."kenshou-evidence" or (errorHandler.buildDepError "kenshou-evidence"))
          (hsPkgs."kenshou-measure" or (errorHandler.buildDepError "kenshou-measure"))
          (hsPkgs."kenshou-remote" or (errorHandler.buildDepError "kenshou-remote"))
          (hsPkgs."kenshou-telemetry" or (errorHandler.buildDepError "kenshou-telemetry"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."settei" or (errorHandler.buildDepError "settei"))
          (hsPkgs."settei-env" or (errorHandler.buildDepError "settei-env"))
          (hsPkgs."settei-optparse-applicative" or (errorHandler.buildDepError "settei-optparse-applicative"))
          (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          (hsPkgs."terminal-size" or (errorHandler.buildDepError "terminal-size"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
        ];
        buildable = true;
      };
      tests = {
        "kenshou-cli-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."kenshou-cli" or (errorHandler.buildDepError "kenshou-cli"))
            (hsPkgs."kenshou-core" or (errorHandler.buildDepError "kenshou-core"))
            (hsPkgs."kenshou-measure" or (errorHandler.buildDepError "kenshou-measure"))
            (hsPkgs."kenshou-remote" or (errorHandler.buildDepError "kenshou-remote"))
            (hsPkgs."kenshou-telemetry" or (errorHandler.buildDepError "kenshou-telemetry"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          ];
          buildable = true;
        };
      };
    };
  }