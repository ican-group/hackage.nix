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
      identifier = { name = "pykinos-core"; version = "0.1.0.2"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/pykinos";
      url = "";
      synopsis = "Unboxed SIMD Roaring Bitmaps, ART IntMap, B+ and FAST search trees";
      description = "Cache-conscious, unboxed, blocked data structures for high-performance\nalgebraic evaluation, AST indexing, and transactional memory in Haskell.\n\nNamed from Greek πυκινός / πυκνός (close, compact, solid; cf. Homer, Iliad\n15.529 'πυκινὸς θώρηξ' and Dionysius of Halicarnassus 'τὸ πυκνόν'), pykinos\neliminates boxed pointer chains in favour of flat, cache-line aligned\nprimitive memory arrays.\n\nProvides two-tier SIMD Roaring bitmaps, 4-tier Adaptive Radix Trees (ART),\nunboxed B+ trees, FAST search tree accelerators, Swiss Tables, and dynamic\nhidden classes.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "pykinos-core-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pykinos-core" or (errorHandler.buildDepError "pykinos-core"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }