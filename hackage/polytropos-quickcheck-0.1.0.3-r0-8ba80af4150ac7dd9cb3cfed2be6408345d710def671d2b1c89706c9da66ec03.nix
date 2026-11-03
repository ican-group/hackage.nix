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
      identifier = { name = "polytropos-quickcheck"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "QuickCheck generators and slot-indexed shrinkers for polytropos open rows";
      description = "Property-based testing integration connecting <https://hackage.haskell.org/package/polytropos polytropos> open records and variants\nto <https://hackage.haskell.org/package/QuickCheck QuickCheck>.\n\nProvides 'Test.QuickCheck.Arbitrary' instances for 'Polytropos.Record' and 'Polytropos.Variant': records generate values\nheterogeneously via 'Polytropos.Core.AllFields' and shrink slot-by-slot (avoiding Cartesian product blowup);\nvariants pick uniformly across constructor tags and shrink strictly within the active\nconstructor branch.\n\nStart at the front door module \"Polytropos.QuickCheck\" for complete documentation,\nshrink semantics, and worked examples.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-quickcheck-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-quickcheck" or (errorHandler.buildDepError "polytropos-quickcheck"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }