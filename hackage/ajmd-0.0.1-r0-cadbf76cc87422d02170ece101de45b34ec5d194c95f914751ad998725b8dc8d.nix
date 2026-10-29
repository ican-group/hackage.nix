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
      specVersion = "2.4";
      identifier = { name = "ajmd"; version = "0.0.1"; };
      license = "MIT";
      copyright = "2026 SimpleX Chat";
      maintainer = "chat@simplex.chat";
      author = "SimpleX Chat";
      homepage = "https://github.com/simplex-chat/ajmd";
      url = "";
      synopsis = "Markdown that is data";
      description = "One language that people read, agents write and code parses. Placeholder; the first release is in preparation.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
    };
  }