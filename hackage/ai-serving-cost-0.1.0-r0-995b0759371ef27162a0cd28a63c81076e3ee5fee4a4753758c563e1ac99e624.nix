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
      identifier = { name = "ai-serving-cost"; version = "0.1.0"; };
      license = "MIT";
      copyright = "2026 Poket Dev LLC";
      maintainer = "hello@poketdev.com";
      author = "Poket Dev";
      homepage = "https://pastagi.com";
      url = "";
      synopsis = "Restate an AI API bill from tokens, rates, and cache share";
      description = "An API bill is a token count times a rate, minus whatever the cache\nknocks off, plus a per-request floor. These functions compute that\nmath directly: price a single request from its input and output\ntokens, price the cache discount at a given volume, and scale a\nper-request cost to a 30-day monthly bill. An audit can restate the\ninvoice line by line instead of trusting the provider's summary.\n\nCompanion to Pastagi, which publishes AI cost audits and serving\nmath. Five pure functions, no dependencies beyond base.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
    };
  }