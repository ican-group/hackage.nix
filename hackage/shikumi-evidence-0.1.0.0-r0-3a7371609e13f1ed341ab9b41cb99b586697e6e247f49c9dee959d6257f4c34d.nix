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
      identifier = { name = "shikumi-evidence"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "nadeem@gmail.com";
      author = "Nadeem Bitar";
      homepage = "";
      url = "";
      synopsis = "Production-evidence optimization and promotion reports for shikumi programs";
      description = "Provenance-bearing envelopes and a composed driver around the shikumi\noptimizer. A trusted job hands the driver a sealed dataset of production\nevidence, a baseline program artifact, an optimizer with a budget and a\ndeclared metric policy. The driver optimizes on the training and validation\nsplits only, compares baseline and candidate once on the protected holdout\nunder recorded or replayed provider responses, and returns a candidate program\nartifact and a comparison report whose conclusion is exactly one of\n@Improved@, @Regressed@, @Inconclusive@ or @Invalid@. Every artifact carries a\nBLAKE3 content digest so a lifecycle owner can verify what a report binds.\nThe package decides comparisons only: it never activates a candidate, holds\nno credential and performs no file access.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."blake3" or (errorHandler.buildDepError "blake3"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."shikumi" or (errorHandler.buildDepError "shikumi"))
          (hsPkgs."shikumi-cache" or (errorHandler.buildDepError "shikumi-cache"))
          (hsPkgs."shikumi-compile" or (errorHandler.buildDepError "shikumi-compile"))
          (hsPkgs."shikumi-eval" or (errorHandler.buildDepError "shikumi-eval"))
          (hsPkgs."shikumi-optimize" or (errorHandler.buildDepError "shikumi-optimize"))
          (hsPkgs."shikumi-trace" or (errorHandler.buildDepError "shikumi-trace"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
        ];
        buildable = true;
      };
      tests = {
        "shikumi-evidence-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."baikai" or (errorHandler.buildDepError "baikai"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."shikumi" or (errorHandler.buildDepError "shikumi"))
            (hsPkgs."shikumi-cache" or (errorHandler.buildDepError "shikumi-cache"))
            (hsPkgs."shikumi-compile" or (errorHandler.buildDepError "shikumi-compile"))
            (hsPkgs."shikumi-eval" or (errorHandler.buildDepError "shikumi-eval"))
            (hsPkgs."shikumi-evidence" or (errorHandler.buildDepError "shikumi-evidence"))
            (hsPkgs."shikumi-optimize" or (errorHandler.buildDepError "shikumi-optimize"))
            (hsPkgs."shikumi-testing" or (errorHandler.buildDepError "shikumi-testing"))
            (hsPkgs."shikumi-trace" or (errorHandler.buildDepError "shikumi-trace"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }