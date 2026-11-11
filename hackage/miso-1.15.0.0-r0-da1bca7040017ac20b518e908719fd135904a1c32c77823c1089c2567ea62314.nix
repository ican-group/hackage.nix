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
    flags = {
      native = false;
      benchmark = false;
      production = false;
      ssr = false;
      template-haskell = false;
      aeson = false;
      text = false;
    };
    package = {
      specVersion = "2.2";
      identifier = { name = "miso"; version = "1.15.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2016-2026 David M. Johnson";
      maintainer = "David M. Johnson <code@dmj.io>";
      author = "David M. Johnson <code@dmj.io>";
      homepage = "https://haskell-miso.org/";
      url = "";
      synopsis = "A tasty Haskell front-end web framework";
      description = "Miso is a small, production-ready, component-oriented, isomorphic Haskell front-end web and mobile framework featuring a virtual-dom, recursive diffing / patching algorithm, event delegation, event batching, SVG, Server-sent events, Websockets, type-safe servant-style routing and an extensible Subscription-based subsystem. Inspired by Elm and React. Miso is pure by default, but side effects can be introduced into the system via the Effect data type. Miso makes heavy use of the GHC FFI and therefore has minimal dependencies.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ] ++ (if system.isJavaScript
          then [
            (hsPkgs."ghcjs-base" or (errorHandler.buildDepError "ghcjs-base"))
          ]
          else pkgs.lib.optionals (system.isWasm32) [
            (hsPkgs."ghc-experimental" or (errorHandler.buildDepError "ghc-experimental"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          ])) ++ pkgs.lib.optional (flags.template-haskell) (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))) ++ pkgs.lib.optionals (flags.aeson) [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
        ];
        buildable = true;
      };
    };
  }