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
      use-template-haskell = true;
      use-reflex-optimizer = false;
      expose-all-unfoldings = false;
      profile-reflex = false;
      split-these = true;
      hydration-tests = true;
      gc-tests = true;
    };
    package = {
      specVersion = "1.24";
      identifier = { name = "reflex-dom-core"; version = "0.8.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "ryan.trinkle@gmail.com";
      author = "Ryan Trinkle";
      homepage = "";
      url = "";
      synopsis = "Functional Reactive Web Apps with Reflex";
      description = "Web applications without callbacks or side-effects.\nReflex-DOM brings the power of functional reactive programming (FRP) to the web.\nBuild HTML and other Document Object Model (DOM) data with a pure functional interface.\n\nReflex-DOM is a Functional Reactive web framework based on the Reflex FRP engine: <https://reflex-frp.org/>.\n\nThe @reflex-dom@ package is a small wrapper around the @reflex-dom-core@ package. It pulls in the\ncorrect set of dependencies for each target platform (GHCJS, WebKitGTK, WASM, mobile, etc.).\nLibraries should depend on @reflex-dom-core@ and executables will usually depend on @reflex-dom@.\nAll of @reflex-dom-core@'s modules are re-exported by @reflex-dom@.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
          (hsPkgs."bimap" or (errorHandler.buildDepError "bimap"))
          (hsPkgs."blaze-builder" or (errorHandler.buildDepError "blaze-builder"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
          (hsPkgs."commutative-semigroups" or (errorHandler.buildDepError "commutative-semigroups"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."constraints" or (errorHandler.buildDepError "constraints"))
          (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."dependent-map" or (errorHandler.buildDepError "dependent-map"))
          (hsPkgs."dependent-sum" or (errorHandler.buildDepError "dependent-sum"))
          (hsPkgs."dependent-sum-template" or (errorHandler.buildDepError "dependent-sum-template"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."exception-transformers" or (errorHandler.buildDepError "exception-transformers"))
          (hsPkgs."ghcjs-dom" or (errorHandler.buildDepError "ghcjs-dom"))
          (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
          (hsPkgs."keycode" or (errorHandler.buildDepError "keycode"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."monad-control" or (errorHandler.buildDepError "monad-control"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."ref-tf" or (errorHandler.buildDepError "ref-tf"))
          (hsPkgs."reflex" or (errorHandler.buildDepError "reflex"))
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."network-uri" or (errorHandler.buildDepError "network-uri"))
          (hsPkgs."zenc" or (errorHandler.buildDepError "zenc"))
        ] ++ (if compiler.isGhcjs && true
          then [
            (hsPkgs."ghcjs-base" or (errorHandler.buildDepError "ghcjs-base"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          ]
          else pkgs.lib.optional (!system.isWindows) (hsPkgs."unix" or (errorHandler.buildDepError "unix")))) ++ (if flags.split-these
          then [
            (hsPkgs."semialign" or (errorHandler.buildDepError "semialign"))
            (hsPkgs."these" or (errorHandler.buildDepError "these"))
          ]
          else [
            (hsPkgs."these" or (errorHandler.buildDepError "these"))
          ])) ++ pkgs.lib.optionals (flags.use-template-haskell) [
          (hsPkgs."dependent-sum-template" or (errorHandler.buildDepError "dependent-sum-template"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
        ];
        buildable = true;
      };
      tests = {
        "hlint" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hlint" or (errorHandler.buildDepError "hlint"))
          ];
          buildable = true;
        };
        "hydration" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."chrome-test-utils" or (errorHandler.buildDepError "chrome-test-utils"))
            (hsPkgs."constraints" or (errorHandler.buildDepError "constraints"))
            (hsPkgs."constraints-extras" or (errorHandler.buildDepError "constraints-extras"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."dependent-map" or (errorHandler.buildDepError "dependent-map"))
            (hsPkgs."dependent-sum" or (errorHandler.buildDepError "dependent-sum"))
            (hsPkgs."dependent-sum-template" or (errorHandler.buildDepError "dependent-sum-template"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."ghcjs-dom" or (errorHandler.buildDepError "ghcjs-dom"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hspec-core" or (errorHandler.buildDepError "hspec-core"))
            (hsPkgs."hspec-webdriver" or (errorHandler.buildDepError "hspec-webdriver"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
            (hsPkgs."jsaddle-warp" or (errorHandler.buildDepError "jsaddle-warp"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."lifted-base" or (errorHandler.buildDepError "lifted-base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."ref-tf" or (errorHandler.buildDepError "ref-tf"))
            (hsPkgs."reflex" or (errorHandler.buildDepError "reflex"))
            (hsPkgs."reflex-dom-core" or (errorHandler.buildDepError "reflex-dom-core"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."silently" or (errorHandler.buildDepError "silently"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."wai-websockets" or (errorHandler.buildDepError "wai-websockets"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
            (hsPkgs."webdriver" or (errorHandler.buildDepError "webdriver"))
            (hsPkgs."websockets" or (errorHandler.buildDepError "websockets"))
            (hsPkgs."which" or (errorHandler.buildDepError "which"))
          ];
          buildable = if !system.isLinux || !system.isX86_64 || flags.profile-reflex || !flags.hydration-tests
            then false
            else true;
        };
        "gc" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."chrome-test-utils" or (errorHandler.buildDepError "chrome-test-utils"))
            (hsPkgs."jsaddle" or (errorHandler.buildDepError "jsaddle"))
            (hsPkgs."jsaddle-warp" or (errorHandler.buildDepError "jsaddle-warp"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."reflex" or (errorHandler.buildDepError "reflex"))
            (hsPkgs."reflex-dom-core" or (errorHandler.buildDepError "reflex-dom-core"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !system.isLinux || !system.isX86_64 || !flags.gc-tests
            then false
            else true;
        };
      };
    };
  }