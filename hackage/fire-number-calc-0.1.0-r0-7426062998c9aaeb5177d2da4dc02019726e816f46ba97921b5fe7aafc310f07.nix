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
      specVersion = "2.2";
      identifier = { name = "fire-number-calc"; version = "0.1.0"; };
      license = "MIT";
      copyright = "2026 Poket Dev LLC";
      maintainer = "hello@poketdev.com";
      author = "Poket Dev";
      homepage = "https://firenomics.com";
      url = "";
      synopsis = "Fire number and timeline math for early retirement planning";
      description = "The arithmetic behind a fire number: the balance a withdrawal rate has\nto support, the gap between today's balance and that target, and the\nyears of saving it takes to close the gap when the portfolio compounds\nat a fixed return.\n\nThe timeline function also prices a growing budget: a spending target\nthat rises each year before retirement pushes the crossing point out,\nand the difference between the flat and growing timelines is the\nworking-year cost of that growth.\n\nCompanion to Firenomics, which publishes the withdrawal-rate and\nsequence-of-returns math these functions follow. Four pure functions\non Doubles, no dependencies beyond base.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
    };
  }