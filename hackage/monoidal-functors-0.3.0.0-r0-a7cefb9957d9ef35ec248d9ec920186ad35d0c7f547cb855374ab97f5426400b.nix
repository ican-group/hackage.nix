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
      identifier = { name = "monoidal-functors"; version = "0.3.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "ssbothwell@gmail.com";
      author = "Solomon Bothwell & Asad Saeeduddin";
      homepage = "http://github.com/solomon-b/monoidal-functors";
      url = "";
      synopsis = "Monoidal Functors Library";
      description = "A typeclass hierarchy for monoidal functors.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
          (hsPkgs."kindly-functors" or (errorHandler.buildDepError "kindly-functors"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
          (hsPkgs."distributive" or (errorHandler.buildDepError "distributive"))
          (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
          (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
          (hsPkgs."semialign" or (errorHandler.buildDepError "semialign"))
          (hsPkgs."semigroupoids" or (errorHandler.buildDepError "semigroupoids"))
          (hsPkgs."these" or (errorHandler.buildDepError "these"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."kind-generics" or (errorHandler.buildDepError "kind-generics"))
        ];
        buildable = true;
      };
      sublibs = {
        "laws" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."monoidal-functors" or (errorHandler.buildDepError "monoidal-functors"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."hedgehog-classes" or (errorHandler.buildDepError "hedgehog-classes"))
            (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
          ];
          buildable = true;
        };
      };
      exes = {
        "co-log" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
            (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
            (hsPkgs."distributive" or (errorHandler.buildDepError "distributive"))
            (hsPkgs."monoidal-functors" or (errorHandler.buildDepError "monoidal-functors"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ];
          buildable = true;
        };
      };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
            (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
            (hsPkgs."distributive" or (errorHandler.buildDepError "distributive"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."hedgehog-classes" or (errorHandler.buildDepError "hedgehog-classes"))
            (hsPkgs."kind-generics" or (errorHandler.buildDepError "kind-generics"))
            (hsPkgs."kind-generics-th" or (errorHandler.buildDepError "kind-generics-th"))
            (hsPkgs."kindly-functors" or (errorHandler.buildDepError "kindly-functors"))
            (hsPkgs."monoidal-functors" or (errorHandler.buildDepError "monoidal-functors"))
            (hsPkgs."monoidal-functors".components.sublibs.laws or (errorHandler.buildDepError "monoidal-functors:laws"))
            (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
            (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
            (hsPkgs."these" or (errorHandler.buildDepError "these"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = true;
        };
      };
    };
  }