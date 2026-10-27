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
    flags = { purescript-bridge = false; werror = false; };
    package = {
      specVersion = "3.4";
      identifier = { name = "kitchen-sink"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2026 Lucas DiCioccio";
      maintainer = "lucas@dicioccio.fr";
      author = "Lucas DiCioccio";
      homepage = "https://kitchensink-tech.github.io/";
      url = "";
      synopsis = "Static-site generator, dev server and API gateway";
      description = "Kitchen-Sink is a static-site generator and a dev/serve HTTP daemon (with\nan API gateway / reverse proxy). Pages are written as CommonMark documents\nsplit into typed sections (JSON metadata, CSS, datasets, tramaj templates,\nexternal generators), and the same production pipeline powers a one-shot\n@produce@ command, a filesystem-watching DEV server that renders targets\non the fly, and a multi-site SERVE daemon with per-domain TLS.\n.\nThe package ships the @kitchen-sink@ executable and the library behind it.\nDocumentation: <https://kitchensink-tech.github.io/>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
          (hsPkgs."either" or (errorHandler.buildDepError "either"))
          (hsPkgs."lens-family-core" or (errorHandler.buildDepError "lens-family-core"))
          (hsPkgs."feed" or (errorHandler.buildDepError "feed"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."http-reverse-proxy" or (errorHandler.buildDepError "http-reverse-proxy"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."http-client-tls" or (errorHandler.buildDepError "http-client-tls"))
          (hsPkgs."process-extras" or (errorHandler.buildDepError "process-extras"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."commonmark" or (errorHandler.buildDepError "commonmark"))
          (hsPkgs."commonmark-extensions" or (errorHandler.buildDepError "commonmark-extensions"))
          (hsPkgs."lucid" or (errorHandler.buildDepError "lucid"))
          (hsPkgs."megaparsec" or (errorHandler.buildDepError "megaparsec"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."mustache" or (errorHandler.buildDepError "mustache"))
          (hsPkgs."optparse-generic" or (errorHandler.buildDepError "optparse-generic"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."blaze-markup" or (errorHandler.buildDepError "blaze-markup"))
          (hsPkgs."blaze-html" or (errorHandler.buildDepError "blaze-html"))
          (hsPkgs."skylighting-core" or (errorHandler.buildDepError "skylighting-core"))
          (hsPkgs."skylighting" or (errorHandler.buildDepError "skylighting"))
          (hsPkgs."servant" or (errorHandler.buildDepError "servant"))
          (hsPkgs."servant-server" or (errorHandler.buildDepError "servant-server"))
          (hsPkgs."prometheus-client" or (errorHandler.buildDepError "prometheus-client"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."prodapi-core" or (errorHandler.buildDepError "prodapi-core"))
          (hsPkgs."prodapi-web" or (errorHandler.buildDepError "prodapi-web"))
          (hsPkgs."prodapi-proxy" or (errorHandler.buildDepError "prodapi-proxy"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."tramaj-hs" or (errorHandler.buildDepError "tramaj-hs"))
          (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
          (hsPkgs."warp-tls" or (errorHandler.buildDepError "warp-tls"))
          (hsPkgs."wai-extra" or (errorHandler.buildDepError "wai-extra"))
          (hsPkgs."xml-conduit" or (errorHandler.buildDepError "xml-conduit"))
          (hsPkgs."fsnotify" or (errorHandler.buildDepError "fsnotify"))
          (hsPkgs."direct-sqlite" or (errorHandler.buildDepError "direct-sqlite"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."crypton" or (errorHandler.buildDepError "crypton"))
          (hsPkgs."memory" or (errorHandler.buildDepError "memory"))
          (hsPkgs."acme-not-a-joke" or (errorHandler.buildDepError "acme-not-a-joke"))
          (hsPkgs."acme-not-a-joke-wai" or (errorHandler.buildDepError "acme-not-a-joke-wai"))
          (hsPkgs."acme-not-a-joke-warp" or (errorHandler.buildDepError "acme-not-a-joke-warp"))
        ];
        buildable = true;
      };
      exes = {
        "kitchen-sink" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."kitchen-sink" or (errorHandler.buildDepError "kitchen-sink"))
          ];
          buildable = true;
        };
        "kitchen-sink-tool" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."kitchen-sink" or (errorHandler.buildDepError "kitchen-sink"))
          ];
          buildable = true;
        };
        "kitchen-sink-purescript-bridge" = {
          depends = pkgs.lib.optionals (flags.purescript-bridge) [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."kitchen-sink" or (errorHandler.buildDepError "kitchen-sink"))
            (hsPkgs."optparse-generic" or (errorHandler.buildDepError "optparse-generic"))
            (hsPkgs."purescript-bridge" or (errorHandler.buildDepError "purescript-bridge"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if flags.purescript-bridge then true else false;
        };
      };
    };
  }