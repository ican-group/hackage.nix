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
      identifier = { name = "shikumi-optimize"; version = "0.3.1.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "";
      url = "";
      synopsis = "The optimizer framework for shikumi LM programs (EP-10)";
      description = "The optimizer framework for shikumi: search procedures that automatically\nimprove a 'Shikumi.Program.Program' by rewriting its per-node optimizable\nparameters (instruction strings and few-shot demonstrations) and scoring each\ncandidate with @evaluate@ (EP-8) over a typed dataset and metric. Four\nstrategies ship — labeled few-shot demo selection, bootstrap few-shot (recover\ndemonstrations from a teacher's successful runs), instruction search\n(MIPRO/COPRO-style coordinate ascent under an explicit call budget), and\nensemble search (combine complementary candidates by majority vote). Each\noptimizer returns a @CompiledProgram@ (EP-9, MasterPlan integration point #6).\nEvery acceptance assertion runs fully offline against a deterministic stub LM,\nso the whole package tests with no network and no API key.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."shikumi" or (errorHandler.buildDepError "shikumi"))
          (hsPkgs."shikumi-cache" or (errorHandler.buildDepError "shikumi-cache"))
          (hsPkgs."shikumi-compile" or (errorHandler.buildDepError "shikumi-compile"))
          (hsPkgs."shikumi-eval" or (errorHandler.buildDepError "shikumi-eval"))
          (hsPkgs."shikumi-trace" or (errorHandler.buildDepError "shikumi-trace"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      tests = {
        "shikumi-optimize-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."shikumi" or (errorHandler.buildDepError "shikumi"))
            (hsPkgs."shikumi-compile" or (errorHandler.buildDepError "shikumi-compile"))
            (hsPkgs."shikumi-eval" or (errorHandler.buildDepError "shikumi-eval"))
            (hsPkgs."shikumi-optimize" or (errorHandler.buildDepError "shikumi-optimize"))
            (hsPkgs."shikumi-testing" or (errorHandler.buildDepError "shikumi-testing"))
            (hsPkgs."shikumi-trace" or (errorHandler.buildDepError "shikumi-trace"))
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