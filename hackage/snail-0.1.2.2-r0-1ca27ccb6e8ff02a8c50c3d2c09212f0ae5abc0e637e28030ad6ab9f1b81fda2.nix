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
      specVersion = "1.12";
      identifier = { name = "snail"; version = "0.1.2.2"; };
      license = "MIT";
      copyright = "Barry Moore II";
      maintainer = "chiroptical@gmail.com";
      author = "Barry Moore II";
      homepage = "https://github.com/chiroptical/snail#readme";
      url = "";
      synopsis = "A programming language with no semantics";
      description = "An s-expression parser and abstract syntax tree for a programming language with no semantics. If you wanted to write an interpreter or compiler you convert the AST into your own.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."text-display" or (errorHandler.buildDepError "text-display"))
        ];
        buildable = true;
      };
      exes = {
        "snail" = {
          depends = [
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."snail" or (errorHandler.buildDepError "snail"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-display" or (errorHandler.buildDepError "text-display"))
          ];
          buildable = true;
        };
      };
      tests = {
        "snail-test" = {
          depends = [
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hspec-discover" or (errorHandler.buildDepError "hspec-discover"))
            (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."raw-strings-qq" or (errorHandler.buildDepError "raw-strings-qq"))
            (hsPkgs."snail" or (errorHandler.buildDepError "snail"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-display" or (errorHandler.buildDepError "text-display"))
          ];
          buildable = true;
        };
      };
    };
  }