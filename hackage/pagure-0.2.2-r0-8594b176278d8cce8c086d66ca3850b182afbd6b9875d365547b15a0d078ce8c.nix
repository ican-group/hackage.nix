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
      specVersion = "1.24";
      identifier = { name = "pagure"; version = "0.2.2"; };
      license = "GPL-2.0-only";
      copyright = "2020-2022,2024,2026 Jens Petersen <petersen@redhat.com>";
      maintainer = "Jens Petersen <petersen@redhat.com>";
      author = "Jens Petersen <petersen@redhat.com>";
      homepage = "https://github.com/juhp/pagure-hs";
      url = "";
      synopsis = "Pagure REST client library";
      description = "A library for querying a Pagure gitforge via REST";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."http-query" or (errorHandler.buildDepError "http-query"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
    };
  }