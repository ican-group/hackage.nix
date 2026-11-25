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
      identifier = { name = "monoidmap-hashable"; version = "0.0.0.4"; };
      license = "Apache-2.0";
      copyright = "2025–2026 Jonathan Knowles";
      maintainer = "mail@jonathanknowles.net";
      author = "Jonathan Knowles";
      homepage = "https://github.com/jonathanknowles/monoidmap/tree/HEAD/packages/monoidmap-hashable";
      url = "";
      synopsis = "Hashing support for monoidmap.";
      description = "Hashing support for the monoidmap package, compatible with the hashable package.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."monoidmap" or (errorHandler.buildDepError "monoidmap"))
        ];
        buildable = true;
      };
    };
  }