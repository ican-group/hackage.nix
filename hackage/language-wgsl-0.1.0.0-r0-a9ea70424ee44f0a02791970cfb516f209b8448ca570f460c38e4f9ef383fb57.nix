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
      identifier = { name = "language-wgsl"; version = "0.1.0.0"; };
      license = "ISC";
      copyright = "Sebastian Paarmann and the University of Copenhagen";
      maintainer = "Troels Henriksen <athas@sigkill.dk>";
      author = "Sebastian Paarmann";
      homepage = "https://github.com/diku-dk/language-wgsl";
      url = "";
      synopsis = "AST, prettyprinter, and other tools for the WebGPU Shading Language.";
      description = "A package for working with the\n<https://www.w3.org/TR/WGSL/ WebGPU Shading Language>\n(WGSL).\n.\nThe package is currently fairly minimalistic, and mostly\nuseful for programs that want to generate WGSL.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
        ];
        buildable = true;
      };
      tests = {
        "language-wgsl-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
            (hsPkgs."language-wgsl" or (errorHandler.buildDepError "language-wgsl"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }