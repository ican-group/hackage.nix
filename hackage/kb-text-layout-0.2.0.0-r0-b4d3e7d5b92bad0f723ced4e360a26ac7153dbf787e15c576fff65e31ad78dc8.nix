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
    flags = { demos = false; };
    package = {
      specVersion = "2.2";
      identifier = { name = "kb-text-layout"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 IC Rainbow";
      maintainer = "aenor.realm@gmail.com";
      author = "IC Rainbow";
      homepage = "";
      url = "";
      synopsis = "Multiline text measurement & layout.";
      description = "";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."kb-text-shape" or (errorHandler.buildDepError "kb-text-shape"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      sublibs = {
        "demos" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hyphenation" or (errorHandler.buildDepError "hyphenation"))
            (hsPkgs."kb-text-layout" or (errorHandler.buildDepError "kb-text-layout"))
            (hsPkgs."kb-text-shape" or (errorHandler.buildDepError "kb-text-shape"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."zstd" or (errorHandler.buildDepError "zstd"))
          ];
          buildable = if !flags.demos then false else true;
        };
      };
      exes = {
        "kb-text-layout-bubbles" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."kb-text-layout".components.sublibs.demos or (errorHandler.buildDepError "kb-text-layout:demos"))
            (hsPkgs."kb-text-layout" or (errorHandler.buildDepError "kb-text-layout"))
            (hsPkgs."kb-text-shape" or (errorHandler.buildDepError "kb-text-shape"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.demos then false else true;
        };
        "kb-text-layout-demo" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."kb-text-layout".components.sublibs.demos or (errorHandler.buildDepError "kb-text-layout:demos"))
            (hsPkgs."kb-text-layout" or (errorHandler.buildDepError "kb-text-layout"))
            (hsPkgs."kb-text-shape" or (errorHandler.buildDepError "kb-text-shape"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.demos then false else true;
        };
        "kb-text-layout-justify" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."kb-text-layout".components.sublibs.demos or (errorHandler.buildDepError "kb-text-layout:demos"))
            (hsPkgs."kb-text-layout" or (errorHandler.buildDepError "kb-text-layout"))
            (hsPkgs."kb-text-shape" or (errorHandler.buildDepError "kb-text-shape"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = if !flags.demos then false else true;
        };
        "kb-text-layout-masonry" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."kb-text-layout".components.sublibs.demos or (errorHandler.buildDepError "kb-text-layout:demos"))
            (hsPkgs."kb-text-layout" or (errorHandler.buildDepError "kb-text-layout"))
            (hsPkgs."kb-text-shape" or (errorHandler.buildDepError "kb-text-shape"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.demos then false else true;
        };
        "kb-text-layout-obstacles" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."kb-text-layout".components.sublibs.demos or (errorHandler.buildDepError "kb-text-layout:demos"))
            (hsPkgs."kb-text-layout" or (errorHandler.buildDepError "kb-text-layout"))
            (hsPkgs."kb-text-shape" or (errorHandler.buildDepError "kb-text-shape"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.demos then false else true;
        };
      };
      tests = {
        "kb-text-layout-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."kb-text-layout".components.sublibs.demos or (errorHandler.buildDepError "kb-text-layout:demos"))
            (hsPkgs."kb-text-layout" or (errorHandler.buildDepError "kb-text-layout"))
            (hsPkgs."kb-text-shape" or (errorHandler.buildDepError "kb-text-shape"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = if !flags.demos then false else true;
        };
      };
      benchmarks = {
        "kb-text-layout-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."kb-text-layout".components.sublibs.demos or (errorHandler.buildDepError "kb-text-layout:demos"))
            (hsPkgs."kb-text-layout" or (errorHandler.buildDepError "kb-text-layout"))
            (hsPkgs."kb-text-shape" or (errorHandler.buildDepError "kb-text-shape"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
          ];
          buildable = if !flags.demos then false else true;
        };
      };
    };
  }