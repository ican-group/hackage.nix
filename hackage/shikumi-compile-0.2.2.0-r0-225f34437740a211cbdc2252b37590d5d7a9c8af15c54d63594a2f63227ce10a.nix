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
      identifier = { name = "shikumi-compile"; version = "0.2.2.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "";
      url = "";
      synopsis = "The compiler layer for shikumi LM programs (EP-9)";
      description = "The compiler layer for shikumi: pure @Program -> Program@ transformations that\nbake a prompting strategy into a program's per-node parameters or structure\n(zero-shot, few-shot, chain-of-thought, retrieval-augmented), the owned type\n@CompiledProgram@ (MasterPlan integration point #6), a minimal @Retriever@\ninterface with a trivial in-memory implementation, and parameter-state\nserialization mirroring DSPy's @dump_state@/@load_state@. A compiler never calls\nthe LM to try variations and keep the best — that is the optimizer (EP-10). Every\nacceptance assertion is about the prompt the model would have seen, observed\noffline through a capturing stub, so the whole package tests with no network.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."shikumi" or (errorHandler.buildDepError "shikumi"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "shikumi-compile-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."shikumi" or (errorHandler.buildDepError "shikumi"))
            (hsPkgs."shikumi-compile" or (errorHandler.buildDepError "shikumi-compile"))
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