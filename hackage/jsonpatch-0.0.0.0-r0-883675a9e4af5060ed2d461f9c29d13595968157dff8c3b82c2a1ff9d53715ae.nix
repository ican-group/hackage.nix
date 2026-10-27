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
      specVersion = "1.18";
      identifier = { name = "jsonpatch"; version = "0.0.0.0"; };
      license = "AGPL-3.0-only";
      copyright = "";
      maintainer = "Patrick Brisbin";
      author = "";
      homepage = "https://github.com/pbrisbin/jsonpatch#readme";
      url = "";
      synopsis = "JSON Patch parsing and application";
      description = "This is a Haskell library for parsing and applying JSON Patches\n\nFrom <https://www.json.org/>:\n\nJSON Patch is a format for describing changes to a\n[JSON](https://www.json.org/) document. It can be used to avoid sending a\nwhole document when only a part has changed. When used in combination with the\n[HTTP PATCH method](https://datatracker.ietf.org/doc/html/rfc5789/), it allows\npartial updates for HTTP APIs in a standards compliant way.\n\nThe patch documents are themselves JSON documents.\n\nJSON Patch is specified in [RFC 6902](https://datatracker.ietf.org/doc/html/rfc6902/) from the IETF.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."aeson-optics" or (errorHandler.buildDepError "aeson-optics"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."optics-core" or (errorHandler.buildDepError "optics-core"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        buildable = true;
      };
      tests = {
        "readme" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."aeson-pretty" or (errorHandler.buildDepError "aeson-pretty"))
            (hsPkgs."aeson-qq" or (errorHandler.buildDepError "aeson-qq"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."jsonpatch" or (errorHandler.buildDepError "jsonpatch"))
            (hsPkgs."markdown-unlit" or (errorHandler.buildDepError "markdown-unlit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
        "spec" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."aeson-optics" or (errorHandler.buildDepError "aeson-optics"))
            (hsPkgs."aeson-pretty" or (errorHandler.buildDepError "aeson-pretty"))
            (hsPkgs."aeson-qq" or (errorHandler.buildDepError "aeson-qq"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hspec-expectations-json" or (errorHandler.buildDepError "hspec-expectations-json"))
            (hsPkgs."jsonpatch" or (errorHandler.buildDepError "jsonpatch"))
            (hsPkgs."optics-core" or (errorHandler.buildDepError "optics-core"))
            (hsPkgs."path" or (errorHandler.buildDepError "path"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }