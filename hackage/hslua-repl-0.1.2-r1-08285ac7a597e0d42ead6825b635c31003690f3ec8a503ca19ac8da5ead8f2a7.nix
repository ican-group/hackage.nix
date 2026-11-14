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
    flags = { executable = false; };
    package = {
      specVersion = "2.2";
      identifier = { name = "hslua-repl"; version = "0.1.2"; };
      license = "MIT";
      copyright = "© 2023-2024 Albert Krewinkel";
      maintainer = "Albert Krewinkel <tarleb@hslua.org>";
      author = "Albert Krewinkel";
      homepage = "https://hslua.org/";
      url = "";
      synopsis = "Isocline-based Lua REPL";
      description = "An embeddable Lua REPL built with Isocline and HsLua.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hslua-core" or (errorHandler.buildDepError "hslua-core"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."isocline" or (errorHandler.buildDepError "isocline"))
          (hsPkgs."lua" or (errorHandler.buildDepError "lua"))
        ];
        buildable = true;
      };
      exes = {
        "luarepl" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hslua-core" or (errorHandler.buildDepError "hslua-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ] ++ pkgs.lib.optional (flags.executable) (hsPkgs."hslua-repl" or (errorHandler.buildDepError "hslua-repl"));
          buildable = if flags.executable then true else false;
        };
      };
    };
  }