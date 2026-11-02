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
      identifier = { name = "sauna-vs-gym-cost"; version = "0.1.0"; };
      license = "MIT";
      copyright = "2026 Poket Dev LLC";
      maintainer = "hello@poketdev.com";
      author = "Poket Dev";
      homepage = "https://hackedself.com";
      url = "";
      synopsis = "Cost-per-session math for home recovery gear";
      description = "A home sauna or cold plunge is a gear price, a usage habit, and an\nelectricity line. These functions spread the gear price over the\nsessions a habit accrues, add the electricity per session,\nand count the visits until the gear beats a per-visit alternative\nlike a gym membership. The break-even count goes infinite when the\nalternative costs less than the electricity alone.\n\nCompanion to HackedSelf, which prices home recovery gear by\ncost-per-session math. Three pure functions on Doubles, no\ndependencies beyond base.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
    };
  }