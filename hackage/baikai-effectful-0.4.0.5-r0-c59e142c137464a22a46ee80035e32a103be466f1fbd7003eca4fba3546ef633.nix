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
      identifier = { name = "baikai-effectful"; version = "0.4.0.5"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2026 Nadeem Bitar";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "";
      url = "";
      synopsis = "effectful binding for the baikai AI-provider transport";
      description = "A thin, policy-free effectful binding over baikai's transport. Provides the dynamic\n`Baikai` effect (Complete / StreamCollect / StreamEach) and interpreters over a real or\nisolated provider registry. Adds no retries, caching, budgets, or error remapping.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
          (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      tests = {
        "baikai-effectful-test" = {
          depends = [
            (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
            (hsPkgs."baikai-effectful" or (errorHandler.buildDepError "baikai-effectful"))
            (hsPkgs."baikai-openai" or (errorHandler.buildDepError "baikai-openai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }