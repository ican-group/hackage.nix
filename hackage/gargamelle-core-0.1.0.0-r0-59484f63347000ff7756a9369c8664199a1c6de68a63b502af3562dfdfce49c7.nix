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
      identifier = { name = "gargamelle-core"; version = "0.1.0.0"; };
      license = "EUPL-1.2";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/gargamelle";
      url = "";
      synopsis = "Core Institution class and categorical colimits for Gargamelle";
      description = "Foundational categorical macro-architecture and Institution class for\nGargamelle. Provides universal categorical pushouts, Grothendieck\ntopologies, institutional satisfaction conditions, and CEGIS loops.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."proarrow" or (errorHandler.buildDepError "proarrow"))
          (hsPkgs."proarrow-equipment" or (errorHandler.buildDepError "proarrow-equipment"))
          (hsPkgs."gargamelle-logic" or (errorHandler.buildDepError "gargamelle-logic"))
          (hsPkgs."gargamelle-model" or (errorHandler.buildDepError "gargamelle-model"))
          (hsPkgs."lattices" or (errorHandler.buildDepError "lattices"))
          (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
        ];
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."gargamelle-core" or (errorHandler.buildDepError "gargamelle-core"))
            (hsPkgs."gargamelle-logic" or (errorHandler.buildDepError "gargamelle-logic"))
            (hsPkgs."gargamelle-model" or (errorHandler.buildDepError "gargamelle-model"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."proarrow" or (errorHandler.buildDepError "proarrow"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          ];
          buildable = true;
        };
      };
    };
  }