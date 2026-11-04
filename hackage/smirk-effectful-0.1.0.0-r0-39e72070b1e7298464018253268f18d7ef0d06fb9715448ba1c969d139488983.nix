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
      identifier = { name = "smirk-effectful"; version = "0.1.0.0"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "Nadia Chambers <nadia.yvette.chambers@ik.me>";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/smirk";
      url = "";
      synopsis = "Effectful (algebraic effects) interface for the Smirk PCRE engine";
      description = "Exposes Smirk's pure, step-bounded PCRE engine as an 'effectful' first-class\neffect ('Smirk.Effect.Effectful'), with pure and fuel-bounded interpreters.\nThis package depends on the plain 'smirk' package for the core engine, so\nconsumers who only need effectful (not polysemy) do not drag in polysemy.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
          (hsPkgs."effectful-core" or (errorHandler.buildDepError "effectful-core"))
          (hsPkgs."effectful-th" or (errorHandler.buildDepError "effectful-th"))
          (hsPkgs."smirk" or (errorHandler.buildDepError "smirk"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "smirk-effectful-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."effectful" or (errorHandler.buildDepError "effectful"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."smirk" or (errorHandler.buildDepError "smirk"))
            (hsPkgs."smirk-effectful" or (errorHandler.buildDepError "smirk-effectful"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }