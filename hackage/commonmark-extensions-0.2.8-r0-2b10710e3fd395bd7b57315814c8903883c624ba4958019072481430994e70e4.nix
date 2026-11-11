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
      specVersion = "1.10";
      identifier = { name = "commonmark-extensions"; version = "0.2.8"; };
      license = "BSD-3-Clause";
      copyright = "2018-2021 John MacFarlane";
      maintainer = "jgm@berkeley.edu";
      author = "John MacFarlane";
      homepage = "https://github.com/jgm/commonmark-hs";
      url = "";
      synopsis = "Pure Haskell commonmark parser.";
      description = "This library provides some useful extensions to core commonmark\nsyntax: smart quotes, definition lists, tables, footnotes, math,\nand more.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
          (hsPkgs."commonmark" or (errorHandler.buildDepError "commonmark"))
          (hsPkgs."emojis" or (errorHandler.buildDepError "emojis"))
        ];
        buildable = true;
      };
      tests = {
        "test-commonmark-extensions" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."commonmark" or (errorHandler.buildDepError "commonmark"))
            (hsPkgs."commonmark-extensions" or (errorHandler.buildDepError "commonmark-extensions"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "benchmark-commonmark-extensions" = {
          depends = [
            (hsPkgs."commonmark" or (errorHandler.buildDepError "commonmark"))
            (hsPkgs."commonmark-extensions" or (errorHandler.buildDepError "commonmark-extensions"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
          ];
          buildable = true;
        };
      };
    };
  }