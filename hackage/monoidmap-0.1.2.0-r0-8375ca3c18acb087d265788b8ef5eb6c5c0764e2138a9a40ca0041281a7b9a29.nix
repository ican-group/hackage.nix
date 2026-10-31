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
      identifier = { name = "monoidmap"; version = "0.1.2.0"; };
      license = "Apache-2.0";
      copyright = "2022–2026 Jonathan Knowles";
      maintainer = "mail@jonathanknowles.net";
      author = "Jonathan Knowles";
      homepage = "https://github.com/jonathanknowles/monoidmap";
      url = "";
      synopsis = "Monoidal map type";
      description = "Monoidal map type with support for semigroup and monoid subclasses.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."groups" or (errorHandler.buildDepError "groups"))
          (hsPkgs."monoid-subclasses" or (errorHandler.buildDepError "monoid-subclasses"))
          (hsPkgs."monoidmap-internal" or (errorHandler.buildDepError "monoidmap-internal"))
          (hsPkgs."nothunks" or (errorHandler.buildDepError "nothunks"))
        ];
        buildable = true;
      };
      tests = {
        "monoidmap-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."groups" or (errorHandler.buildDepError "groups"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hspec-quickcheck-classes" or (errorHandler.buildDepError "hspec-quickcheck-classes"))
            (hsPkgs."monoid-subclasses" or (errorHandler.buildDepError "monoid-subclasses"))
            (hsPkgs."pretty-show" or (errorHandler.buildDepError "pretty-show"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-classes" or (errorHandler.buildDepError "quickcheck-classes"))
            (hsPkgs."quickcheck-groups" or (errorHandler.buildDepError "quickcheck-groups"))
            (hsPkgs."quickcheck-monoid-subclasses" or (errorHandler.buildDepError "quickcheck-monoid-subclasses"))
            (hsPkgs."quickcheck-quid" or (errorHandler.buildDepError "quickcheck-quid"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."monoidmap" or (errorHandler.buildDepError "monoidmap"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }