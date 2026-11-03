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
      identifier = { name = "polytropos-cassava"; version = "0.1.0.3"; };
      license = "(EUPL-1.2 OR Apache-2.0)";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/polytropos";
      url = "";
      synopsis = "Fast CSV codecs for polytropos open records via cassava";
      description = "CSV tabular serialization and deserialization connecting <https://hackage.haskell.org/package/polytropos polytropos> open records\nto the standard Haskell CSV library <https://hackage.haskell.org/package/cassava cassava> without intermediate nominal data conversions.\n\nSupports both named records ('Data.Csv.FromNamedRecord', 'Data.Csv.ToNamedRecord') and ordered positional\nrecords ('Data.Csv.FromRecord', 'Data.Csv.ToRecord') with genuine heterogeneous field decoding via 'Polytropos.Core.AllFields'.\nMarshals directly to and from the flat contiguous 'Data.Primitive.SmallArray.SmallArray' payload without tuple arity\nrestrictions.\n\nStart at the front door module \"Polytropos.Cassava\" for complete documentation,\nstreaming guidance, and worked examples.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."cassava" or (errorHandler.buildDepError "cassava"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
        ];
        buildable = true;
      };
      tests = {
        "polytropos-cassava-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."cassava" or (errorHandler.buildDepError "cassava"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-cassava" or (errorHandler.buildDepError "polytropos-cassava"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
          ];
          buildable = true;
        };
      };
    };
  }