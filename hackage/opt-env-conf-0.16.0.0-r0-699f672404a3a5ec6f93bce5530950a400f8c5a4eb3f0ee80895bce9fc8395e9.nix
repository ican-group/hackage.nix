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
      specVersion = "1.12";
      identifier = { name = "opt-env-conf"; version = "0.16.0.0"; };
      license = "LGPL-3.0-only";
      copyright = "Copyright: (c) 2024-2025 Tom Sydney Kerckhove";
      maintainer = "syd@cs-syd.eu";
      author = "Tom Sydney Kerckhove";
      homepage = "https://github.com/NorfairKing/opt-env-conf#readme";
      url = "";
      synopsis = "Settings parsing for Haskell: command-line arguments, environment variables, and configuration values.";
      description = "";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."autodocodec" or (errorHandler.buildDepError "autodocodec"))
          (hsPkgs."autodocodec-nix" or (errorHandler.buildDepError "autodocodec-nix"))
          (hsPkgs."autodocodec-schema" or (errorHandler.buildDepError "autodocodec-schema"))
          (hsPkgs."autodocodec-yaml" or (errorHandler.buildDepError "autodocodec-yaml"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."path" or (errorHandler.buildDepError "path"))
          (hsPkgs."path-io" or (errorHandler.buildDepError "path-io"))
          (hsPkgs."safe-coloured-text" or (errorHandler.buildDepError "safe-coloured-text"))
          (hsPkgs."safe-coloured-text-layout" or (errorHandler.buildDepError "safe-coloured-text-layout"))
          (hsPkgs."selective" or (errorHandler.buildDepError "selective"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."validity" or (errorHandler.buildDepError "validity"))
          (hsPkgs."validity-containers" or (errorHandler.buildDepError "validity-containers"))
          (hsPkgs."validity-text" or (errorHandler.buildDepError "validity-text"))
        ] ++ pkgs.lib.optional (!system.isWindows) (hsPkgs."safe-coloured-text-terminfo" or (errorHandler.buildDepError "safe-coloured-text-terminfo"));
        buildable = true;
      };
    };
  }