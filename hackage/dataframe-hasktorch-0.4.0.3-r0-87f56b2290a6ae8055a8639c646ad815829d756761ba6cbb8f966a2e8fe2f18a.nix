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
      specVersion = "3.0";
      identifier = { name = "dataframe-hasktorch"; version = "0.4.0.3"; };
      license = "MIT";
      copyright = "";
      maintainer = "mschavinda@gmail.com";
      author = "Michael Chavinda";
      homepage = "";
      url = "";
      synopsis = "Converts between dataframes and hasktorch tensors";
      description = "This package provides seamless conversion between dataframes and hasktorch tensors,\nbridging the gap between data manipulation and machine learning workflows.\n\nKey features:\n\n* Convert dataframes to floating-point or integer tensors for ML training\n* Automatic handling of multi-column and single-column dataframes\n* Smart dimensional handling (1D tensors for single columns, 2D for multiple)\n* Type-safe conversions with comprehensive error handling\n\nTypical workflow: load and transform data using dataframes, then convert to\ntensors for training neural networks with hasktorch.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."dataframe-core" or (errorHandler.buildDepError "dataframe-core"))
          (hsPkgs."dataframe-operations" or (errorHandler.buildDepError "dataframe-operations"))
          (hsPkgs."hasktorch" or (errorHandler.buildDepError "hasktorch"))
        ];
        buildable = true;
      };
      tests = {
        "dataframe-hasktorch-test" = {
          depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
          buildable = true;
        };
      };
    };
  }