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
      identifier = { name = "polytropos-hasql"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "High-performance hasql PostgreSQL decoders for polytropos open records";
      description = "High-performance PostgreSQL row decoding integrating <https://hackage.haskell.org/package/polytropos polytropos> open records\nwith the <https://hackage.haskell.org/package/hasql hasql> driver ecosystem.\n\n'Polytropos.Hasql.recordRow' constructs a 'Hasql.Decoders.Row' decoder that streams SQL columns directly\ninto the contiguous 'Data.Primitive.SmallArray.SmallArray' payload slots in row order. Completely bypasses GHC's\n62-column tuple limit and avoids intermediate tuple allocations during query execution.\n\nStart at the front door module \"Polytropos.Hasql\" for complete documentation,\nrow decoder combinators, and worked examples.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-hasql-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-hasql" or (errorHandler.buildDepError "polytropos-hasql"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."postgresql-binary" or (errorHandler.buildDepError "postgresql-binary"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }