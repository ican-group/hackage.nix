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
      identifier = { name = "cabal-flatpak"; version = "1.0.0"; };
      license = "BSD-3-Clause AND GPL-2.0-or-later";
      copyright = "";
      maintainer = "Hécate";
      author = "Henning Thielemann <haskell@henning-thielemann.de>";
      homepage = "https://codeberg.org/haskell/cabal-flatpak";
      url = "";
      synopsis = "Generate FlatPak modules from a Cabal package description";
      description = "The @generate@ command reads the build plan of a Cabal project\nand writes @haskell-sources.yaml@, a Flatpak module that builds GHC,\n@cabal-install@ and every Hackage dependency without network access.\nIt also writes a stub manifest, a MetaInfo file and a desktop file\nfor a first Flathub submission.\nInspired by Richard Szibele's stackpak:\n<https://gitlab.com/rszibele/stackpak#readme>";
      buildType = "Simple";
    };
    components = {
      sublibs = {
        "vendored-cabal-plan" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "domain" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."cabal-flatpak".components.sublibs.vendored-cabal-plan or (errorHandler.buildDepError "cabal-flatpak:vendored-cabal-plan"))
            (hsPkgs."Cabal-syntax" or (errorHandler.buildDepError "Cabal-syntax"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            (hsPkgs."shell-utility" or (errorHandler.buildDepError "shell-utility"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."utility-ht" or (errorHandler.buildDepError "utility-ht"))
            (hsPkgs."yamlet" or (errorHandler.buildDepError "yamlet"))
          ];
          buildable = true;
        };
        "application" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."algebraic-graphs" or (errorHandler.buildDepError "algebraic-graphs"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."cabal-flatpak".components.sublibs.domain or (errorHandler.buildDepError "cabal-flatpak:domain"))
            (hsPkgs."cabal-flatpak".components.sublibs.vendored-cabal-plan or (errorHandler.buildDepError "cabal-flatpak:vendored-cabal-plan"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
            (hsPkgs."nano-svg" or (errorHandler.buildDepError "nano-svg"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."shell-utility" or (errorHandler.buildDepError "shell-utility"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."utility-ht" or (errorHandler.buildDepError "utility-ht"))
          ];
          buildable = true;
        };
      };
      exes = {
        "cabal-flatpak" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."cabal-flatpak".components.sublibs.application or (errorHandler.buildDepError "cabal-flatpak:application"))
          ];
          buildable = true;
        };
      };
    };
  }