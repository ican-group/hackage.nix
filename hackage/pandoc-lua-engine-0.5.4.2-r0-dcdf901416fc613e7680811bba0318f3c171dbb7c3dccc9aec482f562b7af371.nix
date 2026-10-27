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
    flags = { repl = true; };
    package = {
      specVersion = "2.4";
      identifier = { name = "pandoc-lua-engine"; version = "0.5.4.2"; };
      license = "GPL-2.0-or-later";
      copyright = "© 2006-2024 John MacFarlane, 2017-2024 Albert Krewinkel";
      maintainer = "Albert Krewinkel <albert@hslua.org>";
      author = "John MacFarlane, Albert Krewinkel";
      homepage = "https://pandoc.org";
      url = "";
      synopsis = "Lua engine to power custom pandoc conversions";
      description = "This package provides a pandoc scripting engine based on\nLua.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."citeproc" or (errorHandler.buildDepError "citeproc"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."doclayout" or (errorHandler.buildDepError "doclayout"))
          (hsPkgs."doctemplates" or (errorHandler.buildDepError "doctemplates"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."hslua" or (errorHandler.buildDepError "hslua"))
          (hsPkgs."hslua-module-doclayout" or (errorHandler.buildDepError "hslua-module-doclayout"))
          (hsPkgs."hslua-module-path" or (errorHandler.buildDepError "hslua-module-path"))
          (hsPkgs."hslua-module-system" or (errorHandler.buildDepError "hslua-module-system"))
          (hsPkgs."hslua-module-text" or (errorHandler.buildDepError "hslua-module-text"))
          (hsPkgs."hslua-module-version" or (errorHandler.buildDepError "hslua-module-version"))
          (hsPkgs."hslua-module-zip" or (errorHandler.buildDepError "hslua-module-zip"))
          (hsPkgs."lpeg" or (errorHandler.buildDepError "lpeg"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."pandoc" or (errorHandler.buildDepError "pandoc"))
          (hsPkgs."pandoc-lua-marshal" or (errorHandler.buildDepError "pandoc-lua-marshal"))
          (hsPkgs."pandoc-types" or (errorHandler.buildDepError "pandoc-types"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ] ++ pkgs.lib.optional (flags.repl) (hsPkgs."hslua-repl" or (errorHandler.buildDepError "hslua-repl"));
        buildable = true;
      };
      tests = {
        "test-pandoc-lua-engine" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pandoc-lua-engine" or (errorHandler.buildDepError "pandoc-lua-engine"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hslua" or (errorHandler.buildDepError "hslua"))
            (hsPkgs."pandoc" or (errorHandler.buildDepError "pandoc"))
            (hsPkgs."pandoc-types" or (errorHandler.buildDepError "pandoc-types"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (errorHandler.buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-lua" or (errorHandler.buildDepError "tasty-lua"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }