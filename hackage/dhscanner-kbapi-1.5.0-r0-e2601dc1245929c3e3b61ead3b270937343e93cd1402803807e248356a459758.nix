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
      specVersion = "3.12";
      identifier = { name = "dhscanner-kbapi"; version = "1.5.0"; };
      license = "GPL-3.0-only";
      copyright = "(c) 2026 Oren Ish Shalom";
      maintainer = "Oren Ish Shalom";
      author = "OrenGitHub";
      homepage = "https://github.com/OrenGitHub/dhscanner";
      url = "";
      synopsis = "query language api for dhscanner knowledge base";
      description = "This package defines the API for the knowledge base used by [dhscanner](https://dhscanner.org/docs/).\nThe documentation is intended for both humans 🚶and LLM agents 🤖.\nIn this context, a knowledge base is a structured collection of /code facts/.\nFor a detailed explanation of code facts and how they are generated,\nsee [dhscanner-kbgen](https://hackage.haskell.org/package/dhscanner-kbgen)\non [Hackage](https://hackage.haskell.org/).\n\nCode facts form an abstraction layer over the underlying data representation,\nwhich can be a graph database, a relational database (like Postgres),\na logic program etc.\n\nThe design aims to separate, as much as possible, the following entities:\n\n* the underlying data storage\n* the code facts abstraction layer\n* the exposed knowledge base API\n\nFor instance, migrating from a graph database to a logic program\nrepresentation should conceptually be straightforward.\n\nAs another example, changes to the API should ideally not require\nfundamental modifications to the structure or specification\nof code facts.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."dhscanner-ast" or (errorHandler.buildDepError "dhscanner-ast"))
        ];
        buildable = true;
      };
      exes = {
        "json-schema-creator" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."aeson-pretty" or (errorHandler.buildDepError "aeson-pretty"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."openapi3" or (errorHandler.buildDepError "openapi3"))
            (hsPkgs."dhscanner-kbapi" or (errorHandler.buildDepError "dhscanner-kbapi"))
            (hsPkgs."dhscanner-ast" or (errorHandler.buildDepError "dhscanner-ast"))
          ];
          buildable = true;
        };
      };
    };
  }