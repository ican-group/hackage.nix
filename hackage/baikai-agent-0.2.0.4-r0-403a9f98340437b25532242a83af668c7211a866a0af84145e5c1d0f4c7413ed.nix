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
      specVersion = "3.4";
      identifier = { name = "baikai-agent"; version = "0.2.0.4"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "";
      url = "";
      synopsis = "Unattended coding-agent runs for the Baikai abstraction";
      description = "Runs a local coding-agent command-line tool with no terminal and no\nhuman present: delivers the prompt on standard input, drains both\noutput streams concurrently within a byte limit, and on timeout\nterminates the child's whole process group. The provider-neutral\nvocabulary lives in @Baikai.Agent@ in the core package, and vendor\npackages own the translation into each tool's argument vector.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
          (hsPkgs."baikai-claude" or (errorHandler.buildDepError "baikai-claude"))
          (hsPkgs."baikai-openai" or (errorHandler.buildDepError "baikai-openai"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."settei" or (errorHandler.buildDepError "settei"))
          (hsPkgs."settei-env" or (errorHandler.buildDepError "settei-env"))
          (hsPkgs."settei-kdl" or (errorHandler.buildDepError "settei-kdl"))
          (hsPkgs."settei-optparse-applicative" or (errorHandler.buildDepError "settei-optparse-applicative"))
          (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
        ] ++ pkgs.lib.optional (!system.isWindows) (hsPkgs."unix" or (errorHandler.buildDepError "unix"));
        buildable = true;
      };
      exes = {
        "baikai" = {
          depends = [
            (hsPkgs."baikai-agent" or (errorHandler.buildDepError "baikai-agent"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."settei-env" or (errorHandler.buildDepError "settei-env"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
      tests = {
        "baikai-agent-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
            (hsPkgs."baikai-agent" or (errorHandler.buildDepError "baikai-agent"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."settei" or (errorHandler.buildDepError "settei"))
            (hsPkgs."settei-env" or (errorHandler.buildDepError "settei-env"))
            (hsPkgs."settei-kdl" or (errorHandler.buildDepError "settei-kdl"))
            (hsPkgs."settei-optparse-applicative" or (errorHandler.buildDepError "settei-optparse-applicative"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ] ++ pkgs.lib.optional (!system.isWindows) (hsPkgs."unix" or (errorHandler.buildDepError "unix"));
          build-tools = [
            (hsPkgs.pkgsBuildBuild.baikai-agent.components.exes.baikai or (pkgs.pkgsBuildBuild.baikai or (errorHandler.buildToolDepError "baikai-agent:baikai")))
          ];
          buildable = true;
        };
      };
    };
  }