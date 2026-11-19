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
      identifier = { name = "relay-pagination-hasql"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Nadeem Bitar";
      author = "Nadeem Bitar";
      homepage = "";
      url = "";
      synopsis = "Keyset-pagination engine producing Relay connections from hasql queries";
      description = "Keyset-pagination engine for Relay-style cursors over hasql: declarative\nsort specifications with typed key codecs, generated keyset WHERE/ORDER\nBY/LIMIT clauses with all cursor values as typed SQL parameters, and\nassembly of spec-correct Connection responses.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
          (hsPkgs."hasql-dynamic-statements" or (errorHandler.buildDepError "hasql-dynamic-statements"))
          (hsPkgs."relay-pagination" or (errorHandler.buildDepError "relay-pagination"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
        ];
        buildable = true;
      };
      tests = {
        "relay-pagination-hasql-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."ephemeral-pg" or (errorHandler.buildDepError "ephemeral-pg"))
            (hsPkgs."hasql" or (errorHandler.buildDepError "hasql"))
            (hsPkgs."hasql-dynamic-statements" or (errorHandler.buildDepError "hasql-dynamic-statements"))
            (hsPkgs."relay-pagination" or (errorHandler.buildDepError "relay-pagination"))
            (hsPkgs."relay-pagination-hasql" or (errorHandler.buildDepError "relay-pagination-hasql"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
          ];
          buildable = true;
        };
      };
    };
  }