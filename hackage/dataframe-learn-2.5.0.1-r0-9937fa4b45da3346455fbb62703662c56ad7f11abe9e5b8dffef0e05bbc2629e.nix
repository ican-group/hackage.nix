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
      identifier = { name = "dataframe-learn"; version = "2.5.0.1"; };
      license = "MIT";
      copyright = "(c) 2024-2026 Michael Chavinda";
      maintainer = "mschavinda@gmail.com";
      author = "Michael Chavinda";
      homepage = "";
      url = "";
      synopsis = "Interpretable, expression-returning machine learning for the dataframe ecosystem.";
      description = "A small scikit-learn-style ML library where every model returns both an\ninspectable record and dataframe @Expr@ value(s): linear/ridge/lasso/\nelastic-net and logistic regression, linear and RFF-kernel SVMs, decision\ntrees, gradient boosting and AdaBoost, PCA and Nyström kernel PCA, k-means,\nGaussian mixtures, DBSCAN, and symbolic regression — plus cross-validation\nand grid search. Pure Haskell, built on @dataframe-operations@.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."parallel" or (errorHandler.buildDepError "parallel"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."dataframe-core" or (errorHandler.buildDepError "dataframe-core"))
          (hsPkgs."dataframe-operations" or (errorHandler.buildDepError "dataframe-operations"))
          (hsPkgs."dataframe-expr-serializer" or (errorHandler.buildDepError "dataframe-expr-serializer"))
          (hsPkgs."dataframe-learn".components.sublibs.internal or (errorHandler.buildDepError "dataframe-learn:internal"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."vector-algorithms" or (errorHandler.buildDepError "vector-algorithms"))
        ];
        buildable = true;
      };
      sublibs = {
        "internal" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."parallel" or (errorHandler.buildDepError "parallel"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."dataframe-core" or (errorHandler.buildDepError "dataframe-core"))
            (hsPkgs."dataframe-operations" or (errorHandler.buildDepError "dataframe-operations"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."vector-algorithms" or (errorHandler.buildDepError "vector-algorithms"))
          ];
          buildable = true;
        };
      };
      tests = {
        "learn-internal" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."dataframe-core" or (errorHandler.buildDepError "dataframe-core"))
            (hsPkgs."dataframe-csv" or (errorHandler.buildDepError "dataframe-csv"))
            (hsPkgs."dataframe-learn" or (errorHandler.buildDepError "dataframe-learn"))
            (hsPkgs."dataframe-learn".components.sublibs.internal or (errorHandler.buildDepError "dataframe-learn:internal"))
            (hsPkgs."dataframe-operations" or (errorHandler.buildDepError "dataframe-operations"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }