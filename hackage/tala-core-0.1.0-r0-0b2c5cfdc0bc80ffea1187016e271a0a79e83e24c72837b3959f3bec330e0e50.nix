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
      specVersion = "3.12";
      identifier = { name = "tala-core"; version = "0.1.0"; };
      license = "MPL-2.0";
      copyright = "";
      maintainer = "support@progmasoft.com";
      author = "Progmasoft";
      homepage = "https://tala.run/";
      url = "";
      synopsis = "Tala Core and CorePrep models, verification, and wire codecs";
      description = "The Core and CorePrep intermediate languages of Tala: their models,\ndesugaring into them, optimization, verification and binary codecs.\n.\nThis is an implementation package of the Tala compiler. Its modules may\nchange in any release; tools should depend on tala-tooling instead.\n.\nThe source is also offered under the Progmasoft Linking Exception 1.1\n(LICENSE-EXCEPTION), an additional permission to MPL-2.0 for works that\ncombine this package with independent code.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."tala-syntax" or (errorHandler.buildDepError "tala-syntax"))
        ];
        buildable = true;
      };
      benchmarks = {
        "core-benches" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."tala-core" or (errorHandler.buildDepError "tala-core"))
            (hsPkgs."tala-syntax" or (errorHandler.buildDepError "tala-syntax"))
          ];
          buildable = true;
        };
      };
    };
  }