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
    flags = { anthropic = true; ollama = true; online = true; };
    package = {
      specVersion = "3.0";
      identifier = { name = "shroom-baikai"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "programming@manuelbaerenz.de";
      author = "Manuel Bärenz";
      homepage = "";
      url = "";
      synopsis = "The baikai transport adapter for shroom";
      description = "shroom-baikai implements the\n<https://hackage.haskell.org/package/shroom/docs/Control-Monad-Prompt-Backend.html#t:Backend Backend>\ninterface of <https://hackage.haskell.org/package/shroom shroom> by\ninterpreting the\n<https://hackage.haskell.org/package/baikai-effectful/docs/Baikai-Effectful.html#t:Baikai Baikai>\neffect of\n<https://hackage.haskell.org/package/baikai-effectful baikai-effectful>, so a\nshroom program runs unchanged against Claude\n(<https://hackage.haskell.org/package/baikai-claude baikai-claude>) or any\nOpenAI-compatible host, including a local Ollama\n(<https://hackage.haskell.org/package/baikai-openai baikai-openai>).\nFront-door constructors build a backend from an API key or a base URL and a\nmodel name; a program that needs a different transport interprets the effect\nitself. Use it with <https://hackage.haskell.org/package/shroom shroom>,\nwhich holds the prompt monad, and\n<https://hackage.haskell.org/package/shroom-class shroom-class>, which\ndescribes the types.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
          (hsPkgs."baikai-claude" or (errorHandler.buildDepError "baikai-claude"))
          (hsPkgs."baikai-effectful" or (errorHandler.buildDepError "baikai-effectful"))
          (hsPkgs."baikai-openai" or (errorHandler.buildDepError "baikai-openai"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."shroom" or (errorHandler.buildDepError "shroom"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      exes = {
        "shroom-conference-claude" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
            (hsPkgs."baikai-claude" or (errorHandler.buildDepError "baikai-claude"))
            (hsPkgs."baikai-effectful" or (errorHandler.buildDepError "baikai-effectful"))
            (hsPkgs."baikai-openai" or (errorHandler.buildDepError "baikai-openai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."shroom" or (errorHandler.buildDepError "shroom"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."generics-sop" or (errorHandler.buildDepError "generics-sop"))
            (hsPkgs."openapi3" or (errorHandler.buildDepError "openapi3"))
            (hsPkgs."shroom" or (errorHandler.buildDepError "shroom"))
            (hsPkgs."shroom".components.sublibs.test-utils or (errorHandler.buildDepError "shroom:test-utils"))
            (hsPkgs."shroom-baikai" or (errorHandler.buildDepError "shroom-baikai"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = true;
        };
      };
      tests = {
        "shroom-test-integration-claude" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
            (hsPkgs."baikai-claude" or (errorHandler.buildDepError "baikai-claude"))
            (hsPkgs."baikai-effectful" or (errorHandler.buildDepError "baikai-effectful"))
            (hsPkgs."baikai-openai" or (errorHandler.buildDepError "baikai-openai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."shroom" or (errorHandler.buildDepError "shroom"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."generics-sop" or (errorHandler.buildDepError "generics-sop"))
            (hsPkgs."openapi3" or (errorHandler.buildDepError "openapi3"))
            (hsPkgs."shroom" or (errorHandler.buildDepError "shroom"))
            (hsPkgs."shroom".components.sublibs.test-utils or (errorHandler.buildDepError "shroom:test-utils"))
            (hsPkgs."shroom-baikai" or (errorHandler.buildDepError "shroom-baikai"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = if !(flags.anthropic && flags.online)
            then false
            else true;
        };
        "shroom-test-integration-ollama" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
            (hsPkgs."baikai-claude" or (errorHandler.buildDepError "baikai-claude"))
            (hsPkgs."baikai-effectful" or (errorHandler.buildDepError "baikai-effectful"))
            (hsPkgs."baikai-openai" or (errorHandler.buildDepError "baikai-openai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."shroom" or (errorHandler.buildDepError "shroom"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."generics-sop" or (errorHandler.buildDepError "generics-sop"))
            (hsPkgs."openapi3" or (errorHandler.buildDepError "openapi3"))
            (hsPkgs."shroom" or (errorHandler.buildDepError "shroom"))
            (hsPkgs."shroom".components.sublibs.test-utils or (errorHandler.buildDepError "shroom:test-utils"))
            (hsPkgs."shroom-baikai" or (errorHandler.buildDepError "shroom-baikai"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = if !(flags.ollama && flags.online) then false else true;
        };
        "shroom-test-baikai-offline" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
            (hsPkgs."baikai-claude" or (errorHandler.buildDepError "baikai-claude"))
            (hsPkgs."baikai-effectful" or (errorHandler.buildDepError "baikai-effectful"))
            (hsPkgs."baikai-openai" or (errorHandler.buildDepError "baikai-openai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."shroom" or (errorHandler.buildDepError "shroom"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."shroom-baikai" or (errorHandler.buildDepError "shroom-baikai"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }