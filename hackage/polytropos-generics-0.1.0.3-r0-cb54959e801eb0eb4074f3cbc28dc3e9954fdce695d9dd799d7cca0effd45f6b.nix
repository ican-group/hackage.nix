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
      identifier = { name = "polytropos-generics"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "Structural datatype generics, representation bridging, and whole-data traversal";
      description = "Generic deriving, representation bridging, and structural traversal engine for <https://hackage.haskell.org/package/polytropos polytropos>.\n\nThis package bridges nominal Haskell algebraic data types (ADTs) to and from the\nunified flat representation 'Polytropos.Core.Rep', and provides zero-overhead structural operations\n('Polytropos.Generics.geq', 'Polytropos.Generics.gcompare', 'Polytropos.Generics.gshowsPrec',\n'Polytropos.Generics.gmap', 'Polytropos.Generics.gfoldMap') across open rows ('Polytropos.Record', 'Polytropos.Variant')\nand nominal types.\n\nUnlike <https://hackage.haskell.org/package/large-generics large-generics> (which is strictly record-only and models 1D SOP products),\n@polytropos-generics@ unifies sums and products into one tagged representation backed\nby a 2D dictionary matrix (@SmallArray (SmallArray (DictAny c))@) for O(1) constructor dispatch.\nUnlike standard \"GHC.Generics\", it executes as tight unrolled loops over flat contiguous\nmemory rather than traversing nested binary trees.\n\nStart at the front door module \"Polytropos.Generics\" for architectural rationales,\nusage guidance, and worked examples for both open rows and nominal ADTs.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-generics-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-generics" or (errorHandler.buildDepError "polytropos-generics"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }