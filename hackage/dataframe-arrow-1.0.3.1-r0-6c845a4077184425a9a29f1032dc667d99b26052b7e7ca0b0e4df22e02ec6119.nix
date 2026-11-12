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
    flags = { no-csv = false; no-parquet = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "dataframe-arrow"; version = "1.0.3.1"; };
      license = "MIT";
      copyright = "(c) 2024-2026 Michael Chavinda";
      maintainer = "mschavinda@gmail.com";
      author = "Michael Chavinda";
      homepage = "";
      url = "";
      synopsis = "Arrow C Data Interface foreign library for the dataframe Python bindings.";
      description = "Native-shared library exposing the dataframe lazy executor to\nPython via the Arrow C Data Interface.  Defaults to the\nSIMD CSV reader from @dataframe-fastcsv@.\nCan be used as a standalone FFI library for other languages as well.";
      buildType = "Simple";
    };
    components = {
      foreignlibs = {
        "dataframe-arrow" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."dataframe-core" or (errorHandler.buildDepError "dataframe-core"))
            (hsPkgs."dataframe-learn" or (errorHandler.buildDepError "dataframe-learn"))
            (hsPkgs."dataframe-arrow-bridge" or (errorHandler.buildDepError "dataframe-arrow-bridge"))
            (hsPkgs."dataframe-fastcsv" or (errorHandler.buildDepError "dataframe-fastcsv"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = if flags.no-csv || flags.no-parquet then false else true;
        };
      };
    };
  }