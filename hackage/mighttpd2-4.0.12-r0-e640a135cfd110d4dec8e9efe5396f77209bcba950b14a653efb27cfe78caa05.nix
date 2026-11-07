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
    flags = { tls = false; quic = false; dhall = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "mighttpd2"; version = "4.0.12"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Kazu Yamamoto <kazu@iij.ad.jp>";
      author = "Kazu Yamamoto <kazu@iij.ad.jp>";
      homepage = "https://kazu-yamamoto.github.io/mighttpd2/";
      url = "";
      synopsis = "High performance web server on WAI/warp";
      description = "High performance web server to handle static\nfiles and CGI on WAI/warp.\nReverse proxy functionality is also provided\nto connect web applications behind.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."auto-update" or (errorHandler.buildDepError "auto-update"))
          (hsPkgs."byteorder" or (errorHandler.buildDepError "byteorder"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."conduit-extra" or (errorHandler.buildDepError "conduit-extra"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."http-date" or (errorHandler.buildDepError "http-date"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."http2" or (errorHandler.buildDepError "http2"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          (hsPkgs."streaming-commons" or (errorHandler.buildDepError "streaming-commons"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          (hsPkgs."unix-time" or (errorHandler.buildDepError "unix-time"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          (hsPkgs."wai-app-file-cgi" or (errorHandler.buildDepError "wai-app-file-cgi"))
          (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
        ] ++ pkgs.lib.optional (flags.dhall) (hsPkgs."dhall" or (errorHandler.buildDepError "dhall"))) ++ pkgs.lib.optionals (flags.tls) [
          (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
          (hsPkgs."warp-tls" or (errorHandler.buildDepError "warp-tls"))
        ]) ++ pkgs.lib.optionals (flags.quic) [
          (hsPkgs."quic" or (errorHandler.buildDepError "quic"))
          (hsPkgs."http3" or (errorHandler.buildDepError "http3"))
        ];
        buildable = true;
      };
      exes = {
        "mighty" = {
          depends = (((([
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-date" or (errorHandler.buildDepError "http-date"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."mighttpd2" or (errorHandler.buildDepError "mighttpd2"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."conduit-extra" or (errorHandler.buildDepError "conduit-extra"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."streaming-commons" or (errorHandler.buildDepError "streaming-commons"))
            (hsPkgs."time-manager" or (errorHandler.buildDepError "time-manager"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."wai-app-file-cgi" or (errorHandler.buildDepError "wai-app-file-cgi"))
            (hsPkgs."wai-logger" or (errorHandler.buildDepError "wai-logger"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
          ] ++ pkgs.lib.optionals (flags.tls) [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."tls-session-manager" or (errorHandler.buildDepError "tls-session-manager"))
          ]) ++ pkgs.lib.optionals (flags.quic) [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base16-bytestring" or (errorHandler.buildDepError "base16-bytestring"))
          ]) ++ pkgs.lib.optional (flags.dhall) (hsPkgs."dhall" or (errorHandler.buildDepError "dhall"))) ++ pkgs.lib.optionals (flags.tls) [
            (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
            (hsPkgs."warp-tls" or (errorHandler.buildDepError "warp-tls"))
          ]) ++ pkgs.lib.optionals (flags.quic) [
            (hsPkgs."quic" or (errorHandler.buildDepError "quic"))
            (hsPkgs."warp-quic" or (errorHandler.buildDepError "warp-quic"))
          ];
          buildable = true;
        };
        "mighty-mkindex" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          ];
          buildable = true;
        };
        "mightyctl" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."mighttpd2" or (errorHandler.buildDepError "mighttpd2"))
          ];
          buildable = true;
        };
      };
      tests = {
        "spec" = {
          depends = ([
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."mighttpd2" or (errorHandler.buildDepError "mighttpd2"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."wai-app-file-cgi" or (errorHandler.buildDepError "wai-app-file-cgi"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
          ] ++ pkgs.lib.optionals (flags.tls) [
            (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
            (hsPkgs."warp-tls" or (errorHandler.buildDepError "warp-tls"))
          ]) ++ pkgs.lib.optional (flags.dhall) (hsPkgs."dhall" or (errorHandler.buildDepError "dhall"));
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }