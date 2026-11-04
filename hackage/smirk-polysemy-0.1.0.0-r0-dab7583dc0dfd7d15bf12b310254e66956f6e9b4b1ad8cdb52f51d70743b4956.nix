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
      identifier = { name = "smirk-polysemy"; version = "0.1.0.0"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "Nadia Chambers <nadia.yvette.chambers@ik.me>";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/smirk";
      url = "";
      synopsis = "Polysemy interface for the Smirk PCRE engine";
      description = "Exposes Smirk's pure, step-bounded PCRE engine as a 'polysemy' effect\n('Smirk.Effect.Polysemy'), with pure and fuel-bounded interpreters.\nThis package depends on the plain 'smirk' package for the core engine, so\nconsumers who only need polysemy (not effectful) do not drag in effectful.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."polysemy" or (errorHandler.buildDepError "polysemy"))
          (hsPkgs."smirk" or (errorHandler.buildDepError "smirk"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      tests = {
        "smirk-polysemy-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."polysemy" or (errorHandler.buildDepError "polysemy"))
            (hsPkgs."smirk" or (errorHandler.buildDepError "smirk"))
            (hsPkgs."smirk-polysemy" or (errorHandler.buildDepError "smirk-polysemy"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }