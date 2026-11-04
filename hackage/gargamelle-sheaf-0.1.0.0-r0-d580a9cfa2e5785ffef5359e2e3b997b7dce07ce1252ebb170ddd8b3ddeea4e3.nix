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
      identifier = { name = "gargamelle-sheaf"; version = "0.1.0.0"; };
      license = "EUPL-1.2";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/gargamelle";
      url = "";
      synopsis = "Cellular sheaves and Store comonad diffusion for fault localization";
      description = "Cellular sheaves, Store comonad diffusion, and homological fault\nlocalization for Gargamelle. Provides cell complexes, sheaf cohomology,\nharmonic diffusion, and algebraic topology algorithms for invariant\nlocalization.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
          (hsPkgs."lattices" or (errorHandler.buildDepError "lattices"))
          (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
          (hsPkgs."gargamelle-logic" or (errorHandler.buildDepError "gargamelle-logic"))
          (hsPkgs."gargamelle-model" or (errorHandler.buildDepError "gargamelle-model"))
          (hsPkgs."gargamelle-core" or (errorHandler.buildDepError "gargamelle-core"))
          (hsPkgs."proarrow" or (errorHandler.buildDepError "proarrow"))
        ];
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."gargamelle-sheaf" or (errorHandler.buildDepError "gargamelle-sheaf"))
            (hsPkgs."gargamelle-logic" or (errorHandler.buildDepError "gargamelle-logic"))
            (hsPkgs."gargamelle-model" or (errorHandler.buildDepError "gargamelle-model"))
            (hsPkgs."gargamelle-core" or (errorHandler.buildDepError "gargamelle-core"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."lattices" or (errorHandler.buildDepError "lattices"))
            (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
            (hsPkgs."proarrow" or (errorHandler.buildDepError "proarrow"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          buildable = true;
        };
      };
    };
  }