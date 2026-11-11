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
      identifier = { name = "datastar-hs-brotli"; version = "1.0.1.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "carlo@carlo-hamalainen.net";
      author = "Carlo Hamalainen";
      homepage = "https://github.com/starfederation/datastar-haskell";
      url = "";
      synopsis = "Brotli compressor for datastar-hs";
      description = "@br@ (Brotli) @Content-Encoding@ compressor for\n<https://hackage.haskell.org/package/datastar-hs datastar-hs> SSE streams.\nBrotli compresses extremely well on SSE streams that repeatedly patch\nsimilar HTML elements.\n.\nLinks against the system Brotli C library: @brew install brotli@ on macOS,\n@apt-get install libbrotli-dev pkg-config@ on Debian/Ubuntu.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."brotli" or (errorHandler.buildDepError "brotli"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."datastar-hs" or (errorHandler.buildDepError "datastar-hs"))
        ];
        buildable = true;
      };
      tests = {
        "datastar-hs-brotli-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."brotli" or (errorHandler.buildDepError "brotli"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."datastar-hs" or (errorHandler.buildDepError "datastar-hs"))
            (hsPkgs."datastar-hs-brotli" or (errorHandler.buildDepError "datastar-hs-brotli"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          ];
          buildable = true;
        };
      };
    };
  }