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
      identifier = { name = "ghc-wasm-bindgen"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "2026 Joaquín Rossi";
      maintainer = "joaquin@joaquinrossi.net";
      author = "Joaquín Rossi";
      homepage = "https://github.com/joaquin-rossi/ghc-wasm-bindgen";
      url = "";
      synopsis = "JavaScript/TypeScript bindings for GHC's WASM backend";
      description = "Generate JavaScript and TypeScript bindings for a pure Haskell module\ncompiled with GHC's WebAssembly backend. Exported functions are exposed\nas typed JavaScript functions, and exported data types as TypeScript\ntypes with constructor functions.\n\nSee the README for supported types and usage.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."ghc-paths" or (errorHandler.buildDepError "ghc-paths"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
        ];
        buildable = true;
      };
      exes = {
        "ghc-wasm-bindgen" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."ghc-wasm-bindgen" or (errorHandler.buildDepError "ghc-wasm-bindgen"))
          ];
          buildable = true;
        };
      };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."ghc-wasm-bindgen" or (errorHandler.buildDepError "ghc-wasm-bindgen"))
          ];
          buildable = true;
        };
      };
    };
  }