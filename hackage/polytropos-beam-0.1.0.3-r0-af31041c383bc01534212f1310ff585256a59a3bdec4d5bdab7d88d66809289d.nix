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
      identifier = { name = "polytropos-beam"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "beam database schema integration for polytropos open records";
      description = "Integration enabling <https://hackage.haskell.org/package/polytropos polytropos> open records to act as\n<https://hackage.haskell.org/package/beam-core beam-core> database tables and query projections without\ncompiler out-of-memory crashes on wide schemas (50+ columns).\n\nThe 'Database.Beam.Schema.Tables.Beamable' instance operates directly over the flat contiguous\n'Data.Primitive.SmallArray.SmallArray' payload: scaling column count costs exactly one array slot\nrather than exploding generic-representation AST trees during compilation.\n\nStart at the front door module \"Polytropos.Beam\" for schema definitions,\ntable wrappers, and worked examples.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."beam-core" or (errorHandler.buildDepError "beam-core"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-beam-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."beam-core" or (errorHandler.buildDepError "beam-core"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-beam" or (errorHandler.buildDepError "polytropos-beam"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }