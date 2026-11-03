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
      identifier = { name = "polytropos-profunctors"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "Pure profunctor optics for polytropos open records and variants";
      description = "Integration between <https://hackage.haskell.org/package/polytropos polytropos> and the\n<https://hackage.haskell.org/package/profunctors profunctors> ecosystem.\n\nProvides pure profunctor lenses and prisms ('Polytropos.Profunctors.Lens', 'Polytropos.Profunctors.Prism')\noperating directly over Polytropos's unboxed 'Data.Primitive.SmallArray.SmallArray' memory layout:\n* 'Polytropos.Profunctors.fieldLens' for record fields via compile-time 'Polytropos.Core.FieldIndex'.\n* 'Polytropos.Profunctors.ctorPrism' for variant constructors via 'Polytropos.Core.ConstructorIndex'.\n* Zero-overhead 'Polytropos.Profunctors.slotLens' and 'Polytropos.Profunctors.variantPrism' indexed by array slots and constructor tags.\n\nStart at the front door module \"Polytropos.Profunctors\" for complete documentation,\nusage guidelines, and worked examples.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-profunctors-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
            (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-profunctors" or (errorHandler.buildDepError "polytropos-profunctors"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }