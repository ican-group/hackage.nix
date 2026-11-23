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
      specVersion = "2.0";
      identifier = { name = "ogma-language-xmlspec"; version = "1.17.0"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "ivan.perezdominguez@nasa.gov";
      author = "Ivan Perez, Alwyn Goodloe";
      homepage = "http://nasa.gov";
      url = "";
      synopsis = "Ogma: Runtime Monitor translator: XML Frontend";
      description = "Ogma is a tool to facilitate the integration of safe runtime monitors into\nother systems. Ogma extends\n<https://github.com/Copilot-Language/copilot Copilot>, a high-level runtime\nverification framework that generates hard real-time C99 code.\n\nThis library contains a frontend to read specifications from XML files.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."hxt" or (errorHandler.buildDepError "hxt"))
          (hsPkgs."hxt-regex-xmlschema" or (errorHandler.buildDepError "hxt-regex-xmlschema"))
          (hsPkgs."hxt-xpath" or (errorHandler.buildDepError "hxt-xpath"))
          (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          (hsPkgs."ogma-spec" or (errorHandler.buildDepError "ogma-spec"))
        ];
        buildable = true;
      };
    };
  }