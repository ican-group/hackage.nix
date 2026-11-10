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
    flags = { static = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "swiss-army-knife"; version = "1.2.0.0"; };
      license = "MIT";
      copyright = "2024-2026 Fred Mitchell & Atomlogik";
      maintainer = "fred.mitchell@atomlogik.de";
      author = "Fred Mitchell";
      homepage = "https://github.com/flajann2/swiss-army-knife#readme";
      url = "";
      synopsis = "A collection of small tools to make life a bit easier for the command-line.";
      description = "Please see the README on GitHub at <https://github.com/flajann2/swiss-army-knife#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."http-conduit" or (errorHandler.buildDepError "http-conduit"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."resolv" or (errorHandler.buildDepError "resolv"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
        ];
        buildable = true;
      };
      exes = {
        "sak" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."http-conduit" or (errorHandler.buildDepError "http-conduit"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."resolv" or (errorHandler.buildDepError "resolv"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."swiss-army-knife" or (errorHandler.buildDepError "swiss-army-knife"))
          ];
          buildable = true;
        };
        "pg-config" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."http-conduit" or (errorHandler.buildDepError "http-conduit"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."resolv" or (errorHandler.buildDepError "resolv"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."swiss-army-knife" or (errorHandler.buildDepError "swiss-army-knife"))
          ];
          buildable = true;
        };
      };
      tests = {
        "swiss-army-knife-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."swiss-army-knife" or (errorHandler.buildDepError "swiss-army-knife"))
          ];
          buildable = true;
        };
      };
    };
  }