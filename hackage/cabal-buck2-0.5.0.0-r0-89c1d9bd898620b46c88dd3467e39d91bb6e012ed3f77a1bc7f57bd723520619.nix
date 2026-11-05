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
      specVersion = "3.8";
      identifier = { name = "cabal-buck2"; version = "0.5.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Simon Marlow <marlowsd@gmail.com>";
      author = "Simon Marlow <marlowsd@gmail.com>";
      homepage = "https://github.com/simonmar/cabal-buck2";
      url = "";
      synopsis = "Build a Cabal project with buck2 (the `cabal buck2` external command)";
      description = "This is a [Cabal external command](https://cabal.readthedocs.io/en/stable/external-commands.html) `cabal buck2` that allows\nyou to use [Buck2](https://buck2.build) as the build system for your\nCabal project. For more details see the package README.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
          (hsPkgs."Cabal-syntax" or (errorHandler.buildDepError "Cabal-syntax"))
          (hsPkgs."cabal-install" or (errorHandler.buildDepError "cabal-install"))
          (hsPkgs."cabal-install-solver" or (errorHandler.buildDepError "cabal-install-solver"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
        ];
        buildable = true;
      };
      exes = {
        "cabal-buck2" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."cabal-buck2" or (errorHandler.buildDepError "cabal-buck2"))
            (hsPkgs."cabal-install" or (errorHandler.buildDepError "cabal-install"))
          ];
          buildable = true;
        };
      };
      tests = {
        "fixtures" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."cabal-buck2" or (errorHandler.buildDepError "cabal-buck2"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.cabal-buck2.components.exes.cabal-buck2 or (pkgs.pkgsBuildBuild.cabal-buck2 or (errorHandler.buildToolDepError "cabal-buck2:cabal-buck2")))
          ];
          buildable = true;
        };
      };
    };
  }