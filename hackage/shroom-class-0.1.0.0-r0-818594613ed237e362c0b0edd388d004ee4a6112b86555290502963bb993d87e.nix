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
      identifier = { name = "shroom-class"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "programming@manuelbaerenz.de";
      author = "Manuel Bärenz";
      homepage = "";
      url = "";
      synopsis = "Type-description classes and Template Haskell for shroom";
      description = "shroom-class holds the type-description classes of shroom:\n<https://hackage.haskell.org/package/shroom-class/docs/Data-Shroom-Class.html#t:Describable Describable>\nnames a type for a model, and\n<https://hackage.haskell.org/package/shroom-class/docs/Data-Shroom-Class.html#t:Surveyable Surveyable>\nadds the properties its values must satisfy, as pure Haskell functions, and\nexample values. Template Haskell\nderives\n<https://hackage.haskell.org/package/shroom-class/docs/Data-Shroom-Class.html#t:Describable Describable>\nfrom Haddock comments and type, constructor and field names, so what a human\nreader sees of a type is the description the\nmodel reads, and an empty\n<https://hackage.haskell.org/package/shroom-class/docs/Data-Shroom-Class.html#t:Surveyable Surveyable>\ninstance does the rest. The package has no prompting runtime and depends on\nno HTTP client and no effect system. It is the base of\n<https://hackage.haskell.org/package/shroom shroom>, which runs prompts, and\nof <https://hackage.haskell.org/package/shroom-baikai shroom-baikai>, which\nconnects them to a real model.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."generics-sop" or (errorHandler.buildDepError "generics-sop"))
          (hsPkgs."openapi3" or (errorHandler.buildDepError "openapi3"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."universe-base" or (errorHandler.buildDepError "universe-base"))
        ];
        buildable = true;
      };
      tests = {
        "shroom-class-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."generics-sop" or (errorHandler.buildDepError "generics-sop"))
            (hsPkgs."openapi3" or (errorHandler.buildDepError "openapi3"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."universe-base" or (errorHandler.buildDepError "universe-base"))
            (hsPkgs."shroom-class" or (errorHandler.buildDepError "shroom-class"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }