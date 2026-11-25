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
      identifier = { name = "monoidmap-nothunks"; version = "0.0.0.0"; };
      license = "Apache-2.0";
      copyright = "2023–2026 Jonathan Knowles";
      maintainer = "mail@jonathanknowles.net";
      author = "Jonathan Knowles";
      homepage = "https://github.com/jonathanknowles/monoidmap/tree/HEAD/packages/monoidmap-nothunks";
      url = "";
      synopsis = "Thunk detection support for monoidmap.";
      description = "Thunk detection support for the monoidmap package, compatible with the nothunks package.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."monoidmap" or (errorHandler.buildDepError "monoidmap"))
          (hsPkgs."nothunks" or (errorHandler.buildDepError "nothunks"))
        ];
        buildable = true;
      };
    };
  }