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
      identifier = { name = "datastar-hs"; version = "1.1.2.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "carlo@carlo-hamalainen.net";
      author = "Carlo Hamalainen";
      homepage = "https://github.com/starfederation/datastar-haskell";
      url = "";
      synopsis = "Haskell bindings for Datastar";
      description = "Server-side SDK for building real-time hypermedia applications with\n<https://data-star.dev/ Datastar>. Stream HTML elements, reactive\nsignal updates, and scripts to the browser over server-sent events\n(SSE). Built on WAI so it works with Warp, Scotty, Servant, Yesod,\nand any other WAI-compatible framework.\n.\nThis core package has no system-library dependencies. @Content-Encoding@\ncompressors for SSE streams live in the add-on packages\n<https://hackage.haskell.org/package/datastar-hs-zlib datastar-hs-zlib>\n(gzip, deflate),\n<https://hackage.haskell.org/package/datastar-hs-brotli datastar-hs-brotli>\n(br), and\n<https://hackage.haskell.org/package/datastar-hs-zstd datastar-hs-zstd>\n(zstd).";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
        ];
        buildable = true;
      };
      exes = {
        "e2e-server" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."datastar-hs" or (errorHandler.buildDepError "datastar-hs"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."lucid2" or (errorHandler.buildDepError "lucid2"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          ];
          buildable = true;
        };
      };
      tests = {
        "datastar-hs-test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."datastar-hs" or (errorHandler.buildDepError "datastar-hs"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          ];
          buildable = true;
        };
      };
    };
  }