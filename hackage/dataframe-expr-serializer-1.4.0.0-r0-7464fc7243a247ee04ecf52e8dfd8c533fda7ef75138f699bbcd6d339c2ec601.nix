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
      identifier = { name = "dataframe-expr-serializer"; version = "1.4.0.0"; };
      license = "MIT";
      copyright = "(c) 2024-2026 Michael Chavinda";
      maintainer = "mschavinda@gmail.com";
      author = "Michael Chavinda";
      homepage = "";
      url = "";
      synopsis = "Serialize and deserialize dataframe expressions and pipelines.";
      description = "Save fitted @Expr@ values and whole pipelines (ordered @[NamedExpr]@) to a\nportable JSON form and reload them for inference — in another Haskell\nprocess or from Python, sharing one wire format.\n\n@DataFrame.Expr.Serialize@ is the format-agnostic public API (expression and\npipeline encode/decode plus file/bytes save-load helpers).\n@DataFrame.IR.ExprJson@ is the low-level JSON wire codec — the cross-language\ncontract the Python bindings decode against.\n\nDepends only on @dataframe-core@ and @dataframe-operations@ (both pure), so a\nsaved model can be loaded without the CSV/Parquet/Arrow stack.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."dataframe-core" or (errorHandler.buildDepError "dataframe-core"))
          (hsPkgs."dataframe-operations" or (errorHandler.buildDepError "dataframe-operations"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
    };
  }