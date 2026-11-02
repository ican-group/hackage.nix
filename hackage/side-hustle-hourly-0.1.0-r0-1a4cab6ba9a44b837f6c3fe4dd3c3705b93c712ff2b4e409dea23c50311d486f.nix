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
      identifier = { name = "side-hustle-hourly"; version = "0.1.0"; };
      license = "MIT";
      copyright = "2026 Poket Dev LLC";
      maintainer = "hello@poketdev.com";
      author = "Poket Dev";
      homepage = "https://extrahustles.com";
      url = "";
      synopsis = "True hourly rate math for side hustles and gig work";
      description = "The rate a gig actually pays: the platform cut and job costs come off\nthe gross first, and the net divides by hours that include the unpaid\nadmin work around the paid ones. Two gigs compare on that rate, and\nthe gap between them is the per-hour price of picking the wrong one.\n\nCompanion to Extra Hustles, which prices gig work by its effective\nhourly rate after hidden costs. Three pure functions on Doubles, no\ndependencies beyond base.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
    };
  }