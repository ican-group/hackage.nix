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
      identifier = { name = "agentic-aeson"; version = "0.2.1.0"; };
      license = "BSD-2-Clause";
      copyright = "2026 Tom Wells";
      maintainer = "drshade@gmail.com";
      author = "Tom Wells";
      homepage = "https://github.com/drshade/haskell-agentic";
      url = "";
      synopsis = "Conversions between agentic's values and aeson, and strict JSON Schema";
      description = "Shared by the agentic provider packages: converts the core's Value to and from aeson, and lowers contracts to the strict JSON Schema that providers' structured outputs accept, keeping field order and sharing repeated types through $defs.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."agentic" or (errorHandler.buildDepError "agentic"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
    };
  }