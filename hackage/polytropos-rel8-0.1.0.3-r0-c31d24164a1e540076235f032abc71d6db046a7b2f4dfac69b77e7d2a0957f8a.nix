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
      identifier = { name = "polytropos-rel8"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "rel8 Rel8able table schemas and queries over polytropos open rows";
      description = "High-level type-safe PostgreSQL database mapping connecting <https://hackage.haskell.org/package/polytropos polytropos> open rows\nto Oliver Charles' <https://hackage.haskell.org/package/rel8 rel8> framework.\n\nExposes 'Polytropos.Rel8.PolyRow', a higher-kinded 'Rel8.Rel8able' schema representation whose columns\nare derived directly from the row's type-level field specification into an @HProduct@\ntree. Conversions between @rel8@'s columnar representation and the flat 'Data.Primitive.SmallArray.SmallArray'\npayload execute slot-by-slot in row order without intermediate tuples or arity limits.\n\nStart at the front door module \"Polytropos.Rel8\" for complete documentation,\nschema definitions, and worked query examples.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."rel8" or (errorHandler.buildDepError "rel8"))
          (hsPkgs."rel8-internal" or (errorHandler.buildDepError "rel8-internal"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-rel8-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."rel8" or (errorHandler.buildDepError "rel8"))
            (hsPkgs."rel8-internal" or (errorHandler.buildDepError "rel8-internal"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-rel8" or (errorHandler.buildDepError "polytropos-rel8"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }