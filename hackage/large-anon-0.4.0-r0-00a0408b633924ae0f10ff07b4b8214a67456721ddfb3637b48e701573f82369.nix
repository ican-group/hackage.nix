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
    flags = { debug = false; enable-core-lint = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "large-anon"; version = "0.4.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "edsko@well-typed.com";
      author = "Edsko de Vries";
      homepage = "";
      url = "";
      synopsis = "Scalable anonymous records";
      description = "The @large-anon@ package provides support for anonymous\nrecords in Haskell, with a focus on compile-time (and\nrun-time) scalability.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."ghc-tcplugin-api" or (errorHandler.buildDepError "ghc-tcplugin-api"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."optics-core" or (errorHandler.buildDepError "optics-core"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."record-hasfield" or (errorHandler.buildDepError "record-hasfield"))
          (hsPkgs."sop-core" or (errorHandler.buildDepError "sop-core"))
          (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          (hsPkgs."large-generics" or (errorHandler.buildDepError "large-generics"))
        ] ++ pkgs.lib.optional (flags.debug) (hsPkgs."recover-rtti" or (errorHandler.buildDepError "recover-rtti"));
        buildable = true;
      };
      tests = {
        "test-large-anon" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."arrows" or (errorHandler.buildDepError "arrows"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."large-anon" or (errorHandler.buildDepError "large-anon"))
            (hsPkgs."large-generics" or (errorHandler.buildDepError "large-generics"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."sop-core" or (errorHandler.buildDepError "sop-core"))
            (hsPkgs."Stream" or (errorHandler.buildDepError "Stream"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."validation-selective" or (errorHandler.buildDepError "validation-selective"))
          ] ++ pkgs.lib.optionals (compiler.isGhc && compiler.version.lt "9.10") [
            (hsPkgs."record-dot-preprocessor" or (errorHandler.buildDepError "record-dot-preprocessor"))
            (hsPkgs."aeson-pretty" or (errorHandler.buildDepError "aeson-pretty"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."optics-core" or (errorHandler.buildDepError "optics-core"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            (hsPkgs."record-hasfield" or (errorHandler.buildDepError "record-hasfield"))
          ];
          buildable = true;
        };
      };
    };
  }