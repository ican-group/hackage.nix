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
      identifier = { name = "warp-quic"; version = "0.0.5"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Kazu Yamamoto <kazu@iij.ad.jp>";
      author = "Kazu Yamamoto <kazu@iij.ad.jp>";
      homepage = "https://github.com/yesodweb/wai";
      url = "";
      synopsis = "Warp based on QUIC";
      description = "WAI handler for HTTP/3 based on QUIC";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."http3" or (errorHandler.buildDepError "http3"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."quic" or (errorHandler.buildDepError "quic"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
          (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
        ];
        buildable = true;
      };
    };
  }