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
      identifier = { name = "pandoc-lua-marshal"; version = "0.3.3"; };
      license = "MIT";
      copyright = "© 2017-2026 Albert Krewinkel, John MacFarlane";
      maintainer = "Albert Krewinkel <albert@zeitkraut.de>";
      author = "Albert Krewinkel, John MacFarlane";
      homepage = "https://github.com/pandoc/pandoc-lua-marshal";
      url = "";
      synopsis = "Use pandoc types in Lua";
      description = "This package provides functions to marshal and unmarshal\npandoc document types to and from Lua.\n\nThe values of most types are pushed to pandoc as \"userdata\"\nobjects that wrap a stable pointer to the Haskell value;\nthese objects come with methods to access and modify their\nproperties.\n\nSequences are pushed as normal Lua tables, but are\naugmented with convenience functions.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."hslua" or (errorHandler.buildDepError "hslua"))
          (hsPkgs."hslua-list" or (errorHandler.buildDepError "hslua-list"))
          (hsPkgs."hslua-marshalling" or (errorHandler.buildDepError "hslua-marshalling"))
          (hsPkgs."pandoc-types" or (errorHandler.buildDepError "pandoc-types"))
          (hsPkgs."safe" or (errorHandler.buildDepError "safe"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."hslua-list" or (errorHandler.buildDepError "hslua-list"))
        ];
        buildable = true;
      };
      tests = {
        "pandoc-lua-marshal-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."hslua" or (errorHandler.buildDepError "hslua"))
            (hsPkgs."hslua-list" or (errorHandler.buildDepError "hslua-list"))
            (hsPkgs."hslua-marshalling" or (errorHandler.buildDepError "hslua-marshalling"))
            (hsPkgs."pandoc-types" or (errorHandler.buildDepError "pandoc-types"))
            (hsPkgs."safe" or (errorHandler.buildDepError "safe"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."pandoc-lua-marshal" or (errorHandler.buildDepError "pandoc-lua-marshal"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-lua" or (errorHandler.buildDepError "tasty-lua"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
          ];
          buildable = true;
        };
      };
    };
  }