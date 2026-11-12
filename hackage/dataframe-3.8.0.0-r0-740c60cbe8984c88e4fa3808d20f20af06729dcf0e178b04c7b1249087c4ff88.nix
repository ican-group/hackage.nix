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
    flags = { no-csv = false; no-parquet = false; no-th = false; };
    package = {
      specVersion = "3.4";
      identifier = { name = "dataframe"; version = "3.8.0.0"; };
      license = "MIT";
      copyright = "(c) 2024-2026 Michael Chavinda";
      maintainer = "mschavinda@gmail.com";
      author = "Michael Chavinda";
      homepage = "";
      url = "";
      synopsis = "A fast, safe, and intuitive DataFrame library.";
      description = "A fast, safe, and intuitive DataFrame library for exploratory data analysis.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ((((([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."dataframe-core" or (errorHandler.buildDepError "dataframe-core"))
          (hsPkgs."dataframe-json" or (errorHandler.buildDepError "dataframe-json"))
          (hsPkgs."dataframe-expr-serializer" or (errorHandler.buildDepError "dataframe-expr-serializer"))
          (hsPkgs."dataframe-operations" or (errorHandler.buildDepError "dataframe-operations"))
          (hsPkgs."dataframe-parsing" or (errorHandler.buildDepError "dataframe-parsing"))
          (hsPkgs."dataframe-viz" or (errorHandler.buildDepError "dataframe-viz"))
          (hsPkgs."dataframe-learn" or (errorHandler.buildDepError "dataframe-learn"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ] ++ pkgs.lib.optional (!flags.no-csv) (hsPkgs."dataframe-csv" or (errorHandler.buildDepError "dataframe-csv"))) ++ pkgs.lib.optional (!flags.no-parquet) (hsPkgs."dataframe-parquet" or (errorHandler.buildDepError "dataframe-parquet"))) ++ pkgs.lib.optional (!flags.no-csv && !flags.no-parquet) (hsPkgs."dataframe-lazy" or (errorHandler.buildDepError "dataframe-lazy"))) ++ pkgs.lib.optional (!flags.no-th) (hsPkgs."dataframe-th" or (errorHandler.buildDepError "dataframe-th"))) ++ pkgs.lib.optional (!flags.no-th && !flags.no-csv) (hsPkgs."dataframe-csv-th" or (errorHandler.buildDepError "dataframe-csv-th"))) ++ pkgs.lib.optional (!flags.no-th && !flags.no-parquet) (hsPkgs."dataframe-parquet-th" or (errorHandler.buildDepError "dataframe-parquet-th"));
        buildable = true;
      };
      exes = {
        "dataframe-benchmark-example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."dataframe" or (errorHandler.buildDepError "dataframe"))
            (hsPkgs."dataframe-operations" or (errorHandler.buildDepError "dataframe-operations"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "synthesis" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."dataframe" or (errorHandler.buildDepError "dataframe"))
            (hsPkgs."dataframe-core" or (errorHandler.buildDepError "dataframe-core"))
            (hsPkgs."dataframe-learn" or (errorHandler.buildDepError "dataframe-learn"))
            (hsPkgs."dataframe-operations" or (errorHandler.buildDepError "dataframe-operations"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "dataframe" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ] ++ pkgs.lib.optional (!system.isWindows) (hsPkgs."unix" or (errorHandler.buildDepError "unix"));
          buildable = true;
        };
        "lazy-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."dataframe" or (errorHandler.buildDepError "dataframe"))
            (hsPkgs."dataframe-core" or (errorHandler.buildDepError "dataframe-core"))
            (hsPkgs."dataframe-lazy" or (errorHandler.buildDepError "dataframe-lazy"))
            (hsPkgs."dataframe-parsing" or (errorHandler.buildDepError "dataframe-parsing"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = if flags.no-csv || flags.no-parquet then false else true;
        };
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."dataframe" or (errorHandler.buildDepError "dataframe"))
            (hsPkgs."dataframe-core" or (errorHandler.buildDepError "dataframe-core"))
            (hsPkgs."dataframe-csv" or (errorHandler.buildDepError "dataframe-csv"))
            (hsPkgs."dataframe-expr-serializer" or (errorHandler.buildDepError "dataframe-expr-serializer"))
            (hsPkgs."dataframe-fastcsv" or (errorHandler.buildDepError "dataframe-fastcsv"))
            (hsPkgs."dataframe-json" or (errorHandler.buildDepError "dataframe-json"))
            (hsPkgs."dataframe-lazy" or (errorHandler.buildDepError "dataframe-lazy"))
            (hsPkgs."dataframe-learn" or (errorHandler.buildDepError "dataframe-learn"))
            (hsPkgs."dataframe-operations" or (errorHandler.buildDepError "dataframe-operations"))
            (hsPkgs."dataframe-parquet" or (errorHandler.buildDepError "dataframe-parquet"))
            (hsPkgs."dataframe-parsing" or (errorHandler.buildDepError "dataframe-parsing"))
            (hsPkgs."dataframe-th" or (errorHandler.buildDepError "dataframe-th"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."random-shuffle" or (errorHandler.buildDepError "random-shuffle"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
          buildable = if flags.no-csv || flags.no-parquet || flags.no-th
            then false
            else true;
        };
        "packed-text" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."dataframe" or (errorHandler.buildDepError "dataframe"))
            (hsPkgs."dataframe-core" or (errorHandler.buildDepError "dataframe-core"))
            (hsPkgs."dataframe-operations" or (errorHandler.buildDepError "dataframe-operations"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = if flags.no-csv || flags.no-parquet || flags.no-th
            then false
            else true;
        };
      };
      benchmarks = {
        "dataframe-benchmark" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."dataframe" or (errorHandler.buildDepError "dataframe"))
            (hsPkgs."dataframe-core" or (errorHandler.buildDepError "dataframe-core"))
            (hsPkgs."dataframe-operations" or (errorHandler.buildDepError "dataframe-operations"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
          ];
          buildable = true;
        };
      };
    };
  }