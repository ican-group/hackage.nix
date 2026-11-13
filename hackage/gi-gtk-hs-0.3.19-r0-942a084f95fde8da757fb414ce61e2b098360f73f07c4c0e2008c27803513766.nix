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
      specVersion = "1.10";
      identifier = { name = "gi-gtk-hs"; version = "0.3.19"; };
      license = "LGPL-2.1-only";
      copyright = "";
      maintainer = "mail@jonasplatte.de";
      author = "Jonas Platte,\nDuncan Coutts,\nAxel Simon,\nHamish Mackenzie,\nIñaki García Etxebarria";
      homepage = "https://github.com/haskell-gi/haskell-gi";
      url = "";
      synopsis = "A wrapper for gi-gtk, adding a few more idiomatic API parts on top";
      description = "A wrapper for gi-gtk, adding a few more idiomatic API parts on top";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base-compat" or (errorHandler.buildDepError "base-compat"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."haskell-gi-base" or (errorHandler.buildDepError "haskell-gi-base"))
          (hsPkgs."gi-glib" or (errorHandler.buildDepError "gi-glib"))
          (hsPkgs."gi-gobject" or (errorHandler.buildDepError "gi-gobject"))
          (hsPkgs."gi-gdk3" or (errorHandler.buildDepError "gi-gdk3"))
          (hsPkgs."gi-gtk3" or (errorHandler.buildDepError "gi-gtk3"))
          (hsPkgs."gi-gdkpixbuf" or (errorHandler.buildDepError "gi-gdkpixbuf"))
        ];
        buildable = true;
      };
    };
  }