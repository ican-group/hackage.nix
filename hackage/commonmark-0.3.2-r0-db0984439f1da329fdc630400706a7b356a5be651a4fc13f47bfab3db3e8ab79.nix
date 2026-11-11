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
      specVersion = "2.2";
      identifier = { name = "commonmark"; version = "0.3.2"; };
      license = "BSD-3-Clause";
      copyright = "2018-2021 John MacFarlane";
      maintainer = "jgm@berkeley.edu";
      author = "John MacFarlane";
      homepage = "https://github.com/jgm/commonmark-hs";
      url = "";
      synopsis = "Pure Haskell commonmark parser.";
      description = "This library provides the core data types and functions\nfor parsing commonmark (<https://spec.commonmark.org>).\nThe parser is fully commonmark-compliant and passes the test\nsuite.  It is designed to be customizable and easily extensible.\nTo customize the output, create an AST, or support a new output\nformat, one need only define some new typeclass instances.\nIt is also easy to add new syntax elements or modify existing ones.\n\nAccurate information about source positions is available\nfor all block and inline elements.  Thus the library can be\nused to create an accurate syntax highlighter or\nan editor with live preview.\n\nThe parser has been designed for robust performance\neven in pathological cases that tend to cause stack overflows or\nexponential slowdowns in other parsers, with parsing speed that\nvaries linearly with input length.\n\nRelated packages:\n\n- commonmark-extensions (which defines a number of syntax extensions)\n- commonmark-pandoc (which allows using this parser to create a Pandoc\nstructure)\n- commonmark-cli (a command-line tool for converting and\nsyntax-highlighting commonmark documents)";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."unicode-transforms" or (errorHandler.buildDepError "unicode-transforms"))
          (hsPkgs."unicode-data" or (errorHandler.buildDepError "unicode-data"))
        ];
        buildable = true;
      };
      tests = {
        "test-commonmark" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."commonmark" or (errorHandler.buildDepError "commonmark"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."unicode-transforms" or (errorHandler.buildDepError "unicode-transforms"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "benchmark-commonmark" = {
          depends = [
            (hsPkgs."commonmark" or (errorHandler.buildDepError "commonmark"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
          ];
          buildable = true;
        };
      };
    };
  }