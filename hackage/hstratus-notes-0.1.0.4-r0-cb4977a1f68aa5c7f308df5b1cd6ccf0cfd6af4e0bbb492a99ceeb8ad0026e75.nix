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
      identifier = { name = "hstratus-notes"; version = "0.1.0.4"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2026 Tim Emiola";
      maintainer = "Tim Emiola <adetokunbo@emio.la>";
      author = "Tim Emiola";
      homepage = "";
      url = "";
      synopsis = "Access iCloud Notes";
      description = "Browse notes and folders from iCloud Notes using an authenticated session\nfrom the @hstratus-auth@ library.\n\nProvides read-only access to the Notes CloudKit database: listing folders,\nfetching recent notes, and downloading note content.\n\nThis library is unofficial and not supported by Apple. It may break\nwithout warning if Apple changes their API.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."hstratus-auth" or (errorHandler.buildDepError "hstratus-auth"))
          (hsPkgs."hstratus-notes".components.sublibs.hstratus-notes-internal or (errorHandler.buildDepError "hstratus-notes:hstratus-notes-internal"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
        ];
        buildable = true;
      };
      sublibs = {
        "hstratus-notes-internal" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."hstratus-auth" or (errorHandler.buildDepError "hstratus-auth"))
            (hsPkgs."cereal" or (errorHandler.buildDepError "cereal"))
            (hsPkgs."protobuf" or (errorHandler.buildDepError "protobuf"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
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
            (hsPkgs."benri-hspec" or (errorHandler.buildDepError "benri-hspec"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."hstratus-auth" or (errorHandler.buildDepError "hstratus-auth"))
            (hsPkgs."hstratus-notes" or (errorHandler.buildDepError "hstratus-notes"))
            (hsPkgs."hstratus-notes".components.sublibs.hstratus-notes-internal or (errorHandler.buildDepError "hstratus-notes:hstratus-notes-internal"))
            (hsPkgs."cereal" or (errorHandler.buildDepError "cereal"))
            (hsPkgs."protobuf" or (errorHandler.buildDepError "protobuf"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
            (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
          ];
          buildable = true;
        };
      };
    };
  }