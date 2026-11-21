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
      use-warp = false;
      webkit2gtk = true;
      use-reflex-optimizer = false;
      expose-all-unfoldings = false;
      build-examples = false;
      wasm32 = false;
    };
    package = {
      specVersion = "1.24";
      identifier = { name = "reflex-dom"; version = "0.6.3.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "ryan.trinkle@gmail.com";
      author = "Ryan Trinkle";
      homepage = "";
      url = "";
      synopsis = "Functional Reactive Web Apps with Reflex";
      description = "Web applications without callbacks or side-effects.\nReflex-DOM brings the power of functional reactive programming (FRP) to the web.\nBuild HTML and other Document Object Model (DOM) data with a pure functional interface.\n\nReflex-DOM is a Functional Reactive web framework based on the Reflex FRP engine: <https://reflex-frp.org/>.\n\nThe @reflex-dom@ package is a small wrapper around the @reflex-dom-core@ package. It pulls in the\ncorrect set of dependencies for each target platform (GHCJS, WebKitGTK, WASM, mobile, etc.).\nLibraries should depend on @reflex-dom-core@ and executables will usually depend on @reflex-dom@.\nAll of @reflex-dom-core@'s modules are re-exported by @reflex-dom@.\n\nFor Hackage documentation, please see: <https://hackage.haskell.org/package/reflex-dom-core>.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."reflex" or (errorHandler.buildDepError "reflex"))
          (hsPkgs."reflex-dom-core" or (errorHandler.buildDepError "reflex-dom-core"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ] ++ pkgs.lib.optionals (system.isAndroid) [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."android-activity" or (errorHandler.buildDepError "android-activity"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
        ]) ++ pkgs.lib.optionals (!(compiler.isGhcjs && true)) (if flags.use-warp
          then [
            (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
            (hsPkgs."jsaddle-warp" or (errorHandler.buildDepError "jsaddle-warp"))
          ]
          else if system.isOsx || system.isIOS
            then [
              (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
              (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
              (hsPkgs."jsaddle-wkwebview" or (errorHandler.buildDepError "jsaddle-wkwebview"))
            ]
            else if flags.wasm32
              then [
                (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
                (hsPkgs."jsaddle-wasm" or (errorHandler.buildDepError "jsaddle-wasm"))
              ]
              else pkgs.lib.optional (flags.webkit2gtk && !system.isAndroid) (hsPkgs."jsaddle-webkit2gtk" or (errorHandler.buildDepError "jsaddle-webkit2gtk")));
        build-tools = pkgs.lib.optional (system.isAndroid) (hsPkgs.pkgsBuildBuild.hsc2hs.components.exes.hsc2hs or (pkgs.pkgsBuildBuild.hsc2hs or (errorHandler.buildToolDepError "hsc2hs:hsc2hs")));
        buildable = true;
      };
      exes = {
        "sortableList" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."dependent-map" or (errorHandler.buildDepError "dependent-map"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."reflex" or (errorHandler.buildDepError "reflex"))
            (hsPkgs."reflex-dom" or (errorHandler.buildDepError "reflex-dom"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = if !flags.build-examples then false else true;
        };
        "benchmark" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."dependent-map" or (errorHandler.buildDepError "dependent-map"))
            (hsPkgs."dependent-sum" or (errorHandler.buildDepError "dependent-sum"))
            (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
            (hsPkgs."ghcjs-dom" or (errorHandler.buildDepError "ghcjs-dom"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."prim-uniq" or (errorHandler.buildDepError "prim-uniq"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."reflex" or (errorHandler.buildDepError "reflex"))
            (hsPkgs."reflex-dom" or (errorHandler.buildDepError "reflex-dom"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          buildable = if !(compiler.isGhcjs && true) then false else true;
        };
        "krausest" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."dependent-map" or (errorHandler.buildDepError "dependent-map"))
            (hsPkgs."dependent-sum" or (errorHandler.buildDepError "dependent-sum"))
            (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
            (hsPkgs."ghcjs-dom" or (errorHandler.buildDepError "ghcjs-dom"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."prim-uniq" or (errorHandler.buildDepError "prim-uniq"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."reflex" or (errorHandler.buildDepError "reflex"))
            (hsPkgs."reflex-dom" or (errorHandler.buildDepError "reflex-dom"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = if compiler.isGhcjs && true then true else false;
        };
      };
    };
  }