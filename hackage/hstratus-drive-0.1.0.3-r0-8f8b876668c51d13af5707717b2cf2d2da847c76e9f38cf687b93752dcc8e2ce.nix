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
      identifier = { name = "hstratus-drive"; version = "0.1.0.3"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2026 Tim Emiola";
      maintainer = "Tim Emiola <adetokunbo@emio.la>";
      author = "Tim Emiola";
      homepage = "";
      url = "";
      synopsis = "Access iCloud Drive";
      description = "Browse and download files from iCloud Drive using an authenticated session\nfrom the @hstratus-auth@ library.\n\nProvides access to the main CloudDocs tree: fetching the root folder,\nlisting folder contents, downloading files, and mutating the tree (create,\nrename, delete, upload).\n\nThis library is unofficial and not supported by Apple. It may break\nwithout warning if Apple changes their API.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."hstratus-auth" or (errorHandler.buildDepError "hstratus-auth"))
          (hsPkgs."hstratus-drive".components.sublibs.hstratus-drive-internal or (errorHandler.buildDepError "hstratus-drive:hstratus-drive-internal"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
        ];
        buildable = true;
      };
      sublibs = {
        "hstratus-drive-internal" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."hstratus-auth" or (errorHandler.buildDepError "hstratus-auth"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."hstratus-auth" or (errorHandler.buildDepError "hstratus-auth"))
            (hsPkgs."hstratus-drive" or (errorHandler.buildDepError "hstratus-drive"))
            (hsPkgs."hstratus-drive".components.sublibs.hstratus-drive-internal or (errorHandler.buildDepError "hstratus-drive:hstratus-drive-internal"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
          ];
          buildable = true;
        };
      };
    };
  }