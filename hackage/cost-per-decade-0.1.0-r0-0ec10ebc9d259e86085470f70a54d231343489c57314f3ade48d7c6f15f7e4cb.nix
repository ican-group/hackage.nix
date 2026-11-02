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
      identifier = { name = "cost-per-decade"; version = "0.1.0"; };
      license = "MIT";
      copyright = "2026 Poket Dev LLC";
      maintainer = "hello@poketdev.com";
      author = "Poket Dev";
      homepage = "https://www.durablepicks.com";
      url = "";
      synopsis = "Buy-it-for-life math: cost per decade and break-even years";
      description = "Sticker price compares badly across lifespans: a cheap item replaced\nevery couple of years outruns a durable one that lasts decades. These\nfunctions spread each price over the decades it buys, price a single\nuse, count the units a horizon needs, and find the first year the\ncheap stack has spent as much as the durable one. A warranty-coverage\nverdict rounds it out.\n\nCompanion to Durable Picks, which ranks gear by cost-per-decade\nmath. Five pure functions, no dependencies beyond base.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
    };
  }