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
    flags = {
      dataframe-tests = false;
      extension = false;
      quack-tests = false;
    };
    package = {
      specVersion = "3.4";
      identifier = { name = "duckdb-simple"; version = "1.0.0.0"; };
      license = "MPL-2.0";
      copyright = "";
      maintainer = "mpg@mpg.is";
      author = "Matthias Pall Gissurarson";
      homepage = "https://github.com/Tritlo/duckdb-haskell";
      url = "";
      synopsis = "High-level DuckDB interface inspired by sqlite-simple and postgresql-simple";
      description = "A high-level DuckDB interface with typed parameters and results,\nprepared statements, chunked folds, transactions, and Haskell scalar\nfunctions. The API follows the style of sqlite-simple and postgresql-simple.\n\nThe backend uses the generated V2 API from duckdb-ffi. Upstream marks\nthat API as unstable, so this release requires exactly DuckDB 2.0.0.\nIt provides shared environments and instances, function registration,\nnative streaming, and Arrow batches.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."duckdb-ffi" or (errorHandler.buildDepError "duckdb-ffi"))
          (hsPkgs."geometry-simple" or (errorHandler.buildDepError "geometry-simple"))
          (hsPkgs."hs-bindgen-runtime" or (errorHandler.buildDepError "hs-bindgen-runtime"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
        ];
        buildable = if flags.extension
          then if system.isLinux || system.isOsx then true else false
          else true;
      };
      tests = {
        "duckdb-simple-test" = {
          depends = [
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."duckdb-ffi" or (errorHandler.buildDepError "duckdb-ffi"))
            (hsPkgs."duckdb-simple" or (errorHandler.buildDepError "duckdb-simple"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."geometry-simple" or (errorHandler.buildDepError "geometry-simple"))
            (hsPkgs."hs-bindgen-runtime" or (errorHandler.buildDepError "hs-bindgen-runtime"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-expected-failure" or (errorHandler.buildDepError "tasty-expected-failure"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = if flags.extension then false else true;
        };
        "duckdb-simple-leak-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."duckdb-simple" or (errorHandler.buildDepError "duckdb-simple"))
            (hsPkgs."geometry-simple" or (errorHandler.buildDepError "geometry-simple"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if flags.extension then false else true;
        };
        "duckdb-simple-nonthreaded-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."duckdb-simple" or (errorHandler.buildDepError "duckdb-simple"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if flags.extension then false else true;
        };
        "duckdb-simple-dataframe-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."dataframe-arrow-bridge" or (errorHandler.buildDepError "dataframe-arrow-bridge"))
            (hsPkgs."dataframe-core" or (errorHandler.buildDepError "dataframe-core"))
            (hsPkgs."duckdb-ffi" or (errorHandler.buildDepError "duckdb-ffi"))
            (hsPkgs."duckdb-simple" or (errorHandler.buildDepError "duckdb-simple"))
            (hsPkgs."hs-bindgen-runtime" or (errorHandler.buildDepError "hs-bindgen-runtime"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if flags.extension || !flags.dataframe-tests
            then false
            else true;
        };
        "duckdb-simple-quack-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."duckdb-simple" or (errorHandler.buildDepError "duckdb-simple"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = if flags.extension || !flags.quack-tests
            then false
            else true;
        };
      };
      benchmarks = {
        "duckdb-simple-bench" = {
          depends = [
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."duckdb-simple" or (errorHandler.buildDepError "duckdb-simple"))
            (hsPkgs."geometry-simple" or (errorHandler.buildDepError "geometry-simple"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
          buildable = if flags.extension then false else true;
        };
      };
    };
  }