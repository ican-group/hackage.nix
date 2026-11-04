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
      identifier = { name = "smirk-penelope"; version = "0.1.0.0"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "Nadia Chambers <nadia.yvette.chambers@ik.me>";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/smirk";
      url = "";
      synopsis = "Penelope effect system interface for the Smirk PCRE engine";
      description = "Exposes Smirk's pure, step-bounded PCRE engine as an algebraic effect for\nthe 'penelope' effect system ('Smirk.Effect.Penelope'), with pure and\nfuel-bounded interpreters over flat Polytropos row representations.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."penelope-core" or (errorHandler.buildDepError "penelope-core"))
          (hsPkgs."penelope-effects" or (errorHandler.buildDepError "penelope-effects"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
          (hsPkgs."smirk" or (errorHandler.buildDepError "smirk"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "smirk-penelope-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."penelope-core" or (errorHandler.buildDepError "penelope-core"))
            (hsPkgs."penelope-effects" or (errorHandler.buildDepError "penelope-effects"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
            (hsPkgs."smirk" or (errorHandler.buildDepError "smirk"))
            (hsPkgs."smirk-penelope" or (errorHandler.buildDepError "smirk-penelope"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }