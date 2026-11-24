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
    flags = { executables = false; tests = false; };
    package = {
      specVersion = "2.2";
      identifier = { name = "ktx-font"; version = "0.3.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 IC Rainbow";
      maintainer = "aenor.realm@gmail.com";
      author = "IC Rainbow";
      homepage = "";
      url = "";
      synopsis = "GPU-ready rasterized fonts";
      description = "";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."kb-text-layout" or (errorHandler.buildDepError "kb-text-layout"))
          (hsPkgs."kb-text-shape" or (errorHandler.buildDepError "kb-text-shape"))
          (hsPkgs."ktx-codec" or (errorHandler.buildDepError "ktx-codec"))
          (hsPkgs."msdf-atlas" or (errorHandler.buildDepError "msdf-atlas"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."zstd" or (errorHandler.buildDepError "zstd"))
        ];
        buildable = true;
      };
      exes = {
        "ktx-font-demo" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."brillo" or (errorHandler.buildDepError "brillo"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."ktx-codec" or (errorHandler.buildDepError "ktx-codec"))
            (hsPkgs."ktx-font" or (errorHandler.buildDepError "ktx-font"))
            (hsPkgs."msdf-atlas" or (errorHandler.buildDepError "msdf-atlas"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."zstd" or (errorHandler.buildDepError "zstd"))
          ];
          buildable = if !flags.executables then false else true;
        };
      };
      tests = {
        "ktx-font-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ktx-font" or (errorHandler.buildDepError "ktx-font"))
            (hsPkgs."msdf-atlas" or (errorHandler.buildDepError "msdf-atlas"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = if !flags.tests then false else true;
        };
      };
    };
  }