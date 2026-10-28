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
      identifier = { name = "flatrate-math"; version = "0.1.0"; };
      license = "MIT";
      copyright = "2026 Poket Dev LLC";
      maintainer = "hello@poketdev.com";
      author = "Poket Dev";
      homepage = "https://poketdev.com";
      url = "";
      synopsis = "Benchmark math for flat-rate software subscriptions";
      description = "The arithmetic a software buyer needs before signing a flat-rate\ndevelopment subscription: the annual cost of a fully loaded senior\nhire, the yearly savings of a flat monthly plan against that hire,\nand the break-even month where the subscription catches up to the\nhire.\n\nThe reference case is PoketDev's unlimited-request development\nsubscription at USD 5,995 per month, modeled against a fully loaded\nUS senior software engineer at about USD 18,290 per month in salary,\nbenefits, payroll taxes, bonus, and retirement contributions.\n\nThree pure functions on Doubles, no dependencies beyond base.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
    };
  }