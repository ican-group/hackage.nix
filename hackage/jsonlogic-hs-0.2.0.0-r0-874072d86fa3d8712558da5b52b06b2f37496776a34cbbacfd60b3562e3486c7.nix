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
    flags = { werror = false; differential = false; bench = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "jsonlogic-hs"; version = "0.2.0.0"; };
      license = "MIT";
      copyright = "(c) 2026 Sabrinathan Nair";
      maintainer = "259497327+Bombay-Boyz@users.noreply.github.com";
      author = "Sabrinathan Nair";
      homepage = "https://github.com/Bombay-Boyz/jsonlogic-hs";
      url = "";
      synopsis = "JsonLogic rule engine, checked against the JavaScript reference";
      description = "jsonlogic-hs is a native Haskell implementation of JsonLogic\n(<https://jsonlogic.com>), a small, closed rule language that is itself\nJSON, so rules can be stored, shared between systems, and evaluated\nagainst data without running arbitrary code.\n\nIt follows the JavaScript reference implementation, json-logic-js 2.0.5:\nall 278 cases of the classic shared suite pass, and in lenient arity mode\nit gives the reference's own answers on a committed catalogue of about\n27,000 deliberately awkward rules (type coercion, UTF-16 strings, signed\nzero, NaN, infinities, undefined, numeric edge cases, odd arities, and\nevery rule of the community suite), with a 140,000-case tier and thousands\nof random rules checked against the reference in CI. The few deliberate\ndifferences are listed in docs/COMPATIBILITY.md.\n\nRules are compiled once and run many times. Evaluation is pure and bounded:\nrule depth, evaluation steps, string length and array length all have\nconfigurable limits, so rules from an untrusted source cannot run\nunbounded work or exhaust memory. Every error carries the JSON Pointer of\nthe rule node that failed. Arity checking is strict by default and can be\nswitched to the reference's lenient behaviour. Custom operators are\nsupplied by the caller, and dataUse reports which parts of the data a rule\ncan read.\n\nThe supported API is the \"JsonLogic\" module; the \"JsonLogic.Core\" modules are\nhidden from the documentation and carry no stability promise;\ndocs/TUTORIAL.md walks through it. The package also installs a small\ncommand, jsonlogic, to evaluate, check and inspect rules.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."data-fix" or (errorHandler.buildDepError "data-fix"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."ghc-bignum" or (errorHandler.buildDepError "ghc-bignum"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      exes = {
        "jsonlogic" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."jsonlogic-hs" or (errorHandler.buildDepError "jsonlogic-hs"))
          ];
          buildable = true;
        };
        "jsonlogic-hs-differential" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
            (hsPkgs."jsonlogic-hs" or (errorHandler.buildDepError "jsonlogic-hs"))
          ];
          buildable = if !flags.differential then false else true;
        };
        "jsonlogic-hs-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."jsonlogic-hs" or (errorHandler.buildDepError "jsonlogic-hs"))
          ];
          buildable = if !flags.bench then false else true;
        };
      };
      tests = {
        "jsonlogic-hs-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."data-fix" or (errorHandler.buildDepError "data-fix"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."jsonlogic-hs" or (errorHandler.buildDepError "jsonlogic-hs"))
          ];
          buildable = true;
        };
        "jsonlogic-hs-conformance" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."jsonlogic-hs" or (errorHandler.buildDepError "jsonlogic-hs"))
          ];
          buildable = true;
        };
        "jsonlogic-hs-outliers" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
            (hsPkgs."jsonlogic-hs" or (errorHandler.buildDepError "jsonlogic-hs"))
          ];
          buildable = true;
        };
        "jsonlogic-hs-tutorial" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."jsonlogic-hs" or (errorHandler.buildDepError "jsonlogic-hs"))
          ];
          buildable = true;
        };
        "jsonlogic-hs-community" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."jsonlogic-hs" or (errorHandler.buildDepError "jsonlogic-hs"))
          ];
          buildable = true;
        };
      };
    };
  }