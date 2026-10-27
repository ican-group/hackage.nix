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
      identifier = { name = "hstratus-auth"; version = "0.2.0.3"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2026 Tim Emiola";
      maintainer = "Tim Emiola <adetokunbo@emio.la>";
      author = "Tim Emiola";
      homepage = "";
      url = "";
      synopsis = "Authenticate with iCloud";
      description = "Authenticate with iCloud using Apple ID credentials stored on disk.\n\nThe full sign-in flow — SRP credential exchange followed by any required\ntwo-factor (2FA) or legacy two-step (2SA) challenge — is handled by a\nsingle login call. On success the library caches a session token for use\nwith other iCloud services.\n\nThis library is unofficial and not supported by Apple. It may break\nwithout warning if Apple changes their authentication protocol.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."crypto-srp" or (errorHandler.buildDepError "crypto-srp"))
          (hsPkgs."cryptohash-sha256" or (errorHandler.buildDepError "cryptohash-sha256"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."string-conv" or (errorHandler.buildDepError "string-conv"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          (hsPkgs."web-cookiejar" or (errorHandler.buildDepError "web-cookiejar"))
          (hsPkgs."xdg-basedir" or (errorHandler.buildDepError "xdg-basedir"))
          (hsPkgs."hstratus-auth".components.sublibs.hstratus-auth-internal or (errorHandler.buildDepError "hstratus-auth:hstratus-auth-internal"))
        ];
        buildable = true;
      };
      sublibs = {
        "hstratus-auth-internal" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."aeson-casing" or (errorHandler.buildDepError "aeson-casing"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."crypto-srp" or (errorHandler.buildDepError "crypto-srp"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."simple-prompt" or (errorHandler.buildDepError "simple-prompt"))
            (hsPkgs."string-conv" or (errorHandler.buildDepError "string-conv"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."uuid" or (errorHandler.buildDepError "uuid"))
            (hsPkgs."xdg-basedir" or (errorHandler.buildDepError "xdg-basedir"))
          ];
          buildable = true;
        };
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."cryptohash-sha1" or (errorHandler.buildDepError "cryptohash-sha1"))
            (hsPkgs."cryptohash-sha256" or (errorHandler.buildDepError "cryptohash-sha256"))
            (hsPkgs."cryptohash-sha512" or (errorHandler.buildDepError "cryptohash-sha512"))
            (hsPkgs."crypto-srp" or (errorHandler.buildDepError "crypto-srp"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."benri-hspec" or (errorHandler.buildDepError "benri-hspec"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."hstratus-auth" or (errorHandler.buildDepError "hstratus-auth"))
            (hsPkgs."silently" or (errorHandler.buildDepError "silently"))
            (hsPkgs."string-conv" or (errorHandler.buildDepError "string-conv"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
            (hsPkgs."main-tester" or (errorHandler.buildDepError "main-tester"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."hstratus-auth".components.sublibs.hstratus-auth-internal or (errorHandler.buildDepError "hstratus-auth:hstratus-auth-internal"))
          ];
          buildable = true;
        };
      };
    };
  }