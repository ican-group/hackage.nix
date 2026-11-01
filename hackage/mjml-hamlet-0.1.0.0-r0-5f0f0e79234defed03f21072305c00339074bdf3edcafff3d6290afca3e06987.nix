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
      identifier = { name = "mjml-hamlet"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "2026 Kronor";
      maintainer = "lorenzo@kronor.io";
      author = "José Lorenzo Rodríguez";
      homepage = "";
      url = "";
      synopsis = "MJML email templates in Hamlet syntax, checked at compile time";
      description = "A quasiquoter for MJML documents written with Hamlet's indentation-based\nsyntax and interpolation. Unknown elements, misplaced elements, undeclared\nattributes and attribute values of the wrong type are compile errors.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."blaze-markup" or (errorHandler.buildDepError "blaze-markup"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
          (hsPkgs."mjml" or (errorHandler.buildDepError "mjml"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."shakespeare" or (errorHandler.buildDepError "shakespeare"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."blaze-markup" or (errorHandler.buildDepError "blaze-markup"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."mjml" or (errorHandler.buildDepError "mjml"))
            (hsPkgs."mjml-hamlet" or (errorHandler.buildDepError "mjml-hamlet"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }