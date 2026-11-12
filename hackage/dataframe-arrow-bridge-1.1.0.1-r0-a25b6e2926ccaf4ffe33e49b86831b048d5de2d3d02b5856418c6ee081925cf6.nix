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
      identifier = { name = "dataframe-arrow-bridge"; version = "1.1.0.1"; };
      license = "MIT";
      copyright = "(c) 2024-2026 Michael Chavinda";
      maintainer = "mschavinda@gmail.com";
      author = "Michael Chavinda";
      homepage = "";
      url = "";
      synopsis = "Arrow C Data Interface bridge and plan IR for the dataframe ecosystem.";
      description = "Zero-copy conversion between @DataFrame@ and the Arrow C Data\nInterface, plus the plan IR that the Python bindings and the\n@dataframe-arrow@ foreign library execute. Re-exports\n@DataFrame.IR.ExprJson@ from @dataframe-expr-serializer@ so\nconsumers keep a single import.\n.\nPreviously shipped as the @arrow-bridge@ public sublibrary of the\n@dataframe@ meta-package; it is a standalone package from 1.0.0.0 so\nthat dependents resolve on Hackage.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."dataframe-core" or (errorHandler.buildDepError "dataframe-core"))
          (hsPkgs."dataframe-csv" or (errorHandler.buildDepError "dataframe-csv"))
          (hsPkgs."dataframe-expr-serializer" or (errorHandler.buildDepError "dataframe-expr-serializer"))
          (hsPkgs."dataframe-json" or (errorHandler.buildDepError "dataframe-json"))
          (hsPkgs."dataframe-lazy" or (errorHandler.buildDepError "dataframe-lazy"))
          (hsPkgs."dataframe-operations" or (errorHandler.buildDepError "dataframe-operations"))
          (hsPkgs."dataframe-parquet" or (errorHandler.buildDepError "dataframe-parquet"))
          (hsPkgs."dataframe-parsing" or (errorHandler.buildDepError "dataframe-parsing"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
    };
  }