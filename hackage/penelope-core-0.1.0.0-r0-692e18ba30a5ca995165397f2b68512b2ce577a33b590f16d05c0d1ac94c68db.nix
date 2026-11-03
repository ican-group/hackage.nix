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
      identifier = { name = "penelope-core"; version = "0.1.0.0"; };
      license = "EUPL-1.2";
      copyright = "";
      maintainer = "nadia.yvette.chambers@ik.me";
      author = "Nadia Yvette Chambers";
      homepage = "https://github.com/NadiaYvette/penelope";
      url = "";
      synopsis = "Unpacked (m,n,k,r)-ary Polycategorical Effect System Core";
      description = "Core polycategorical effect engine generalizing Heftia and Kernmantle.\nProvides the unpacked (m,n,k,r)-ary polycategorical syntax GADT,\nO(1) jump-table route optimization via Polytropos row indexing,\ncategorical frame rule wiring, disjunctive fanout, row weakening,\nhigher-order algebraic elaboration, and vector interpretation.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
          (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
        ];
        buildable = true;
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."penelope-core" or (errorHandler.buildDepError "penelope-core"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
          ];
          buildable = true;
        };
        "inspection" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."inspection-testing" or (errorHandler.buildDepError "inspection-testing"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."penelope-core" or (errorHandler.buildDepError "penelope-core"))
            (hsPkgs."polytropos-core" or (errorHandler.buildDepError "polytropos-core"))
            (hsPkgs."polytropos-plugin" or (errorHandler.buildDepError "polytropos-plugin"))
          ];
          buildable = true;
        };
      };
    };
  }