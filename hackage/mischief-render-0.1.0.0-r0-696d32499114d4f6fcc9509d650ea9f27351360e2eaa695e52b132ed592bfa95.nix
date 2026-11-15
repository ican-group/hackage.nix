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
      identifier = { name = "mischief-render"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "pvdoriginal2019@gmail.com";
      author = "Damon";
      homepage = "https://codeberg.org/mischief/mischief";
      url = "";
      synopsis = "Rendering for the Mischief game engine.";
      description = "This library provides both low and high-level rendering tools for Mischief. It also comes\nwith WGPU bindings, an Animation system, and a few pre-defined Materials.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
          (hsPkgs."JuicyPixels-extra" or (errorHandler.buildDepError "JuicyPixels-extra"))
          (hsPkgs."kdl-hs" or (errorHandler.buildDepError "kdl-hs"))
          (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
          (hsPkgs."mischief-assets" or (errorHandler.buildDepError "mischief-assets"))
          (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
          (hsPkgs."mischief-math" or (errorHandler.buildDepError "mischief-math"))
          (hsPkgs."mischief-sdl" or (errorHandler.buildDepError "mischief-sdl"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."sdl3-bindgen-sys" or (errorHandler.buildDepError "sdl3-bindgen-sys"))
          (hsPkgs."singletons" or (errorHandler.buildDepError "singletons"))
          (hsPkgs."singletons-base" or (errorHandler.buildDepError "singletons-base"))
          (hsPkgs."singletons-th" or (errorHandler.buildDepError "singletons-th"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
        ];
        libs = [
          (pkgs."wgpu_native" or (errorHandler.sysDepError "wgpu_native"))
        ];
        pkgconfig = [
          (pkgconfPkgs."sdl3" or (errorHandler.pkgConfDepError "sdl3"))
        ];
        build-tools = [
          (hsPkgs.pkgsBuildBuild.hsc2hs.components.exes.hsc2hs or (pkgs.pkgsBuildBuild.hsc2hs or (errorHandler.buildToolDepError "hsc2hs:hsc2hs")))
        ];
        buildable = true;
      };
      exes = {
        "example-animation" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."mischief-assets" or (errorHandler.buildDepError "mischief-assets"))
            (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
            (hsPkgs."mischief-input" or (errorHandler.buildDepError "mischief-input"))
            (hsPkgs."mischief-math" or (errorHandler.buildDepError "mischief-math"))
            (hsPkgs."mischief-render" or (errorHandler.buildDepError "mischief-render"))
            (hsPkgs."mischief-sdl" or (errorHandler.buildDepError "mischief-sdl"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."sdl3-bindgen-sys" or (errorHandler.buildDepError "sdl3-bindgen-sys"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          pkgconfig = [
            (pkgconfPkgs."sdl3" or (errorHandler.pkgConfDepError "sdl3"))
          ];
          buildable = true;
        };
        "example-postprocess" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."mischief-assets" or (errorHandler.buildDepError "mischief-assets"))
            (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
            (hsPkgs."mischief-input" or (errorHandler.buildDepError "mischief-input"))
            (hsPkgs."mischief-math" or (errorHandler.buildDepError "mischief-math"))
            (hsPkgs."mischief-render" or (errorHandler.buildDepError "mischief-render"))
            (hsPkgs."mischief-sdl" or (errorHandler.buildDepError "mischief-sdl"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."sdl3-bindgen-sys" or (errorHandler.buildDepError "sdl3-bindgen-sys"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          pkgconfig = [
            (pkgconfPkgs."sdl3" or (errorHandler.pkgConfDepError "sdl3"))
          ];
          buildable = true;
        };
        "example-ysort" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."mischief-assets" or (errorHandler.buildDepError "mischief-assets"))
            (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
            (hsPkgs."mischief-input" or (errorHandler.buildDepError "mischief-input"))
            (hsPkgs."mischief-math" or (errorHandler.buildDepError "mischief-math"))
            (hsPkgs."mischief-render" or (errorHandler.buildDepError "mischief-render"))
            (hsPkgs."mischief-sdl" or (errorHandler.buildDepError "mischief-sdl"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."sdl3-bindgen-sys" or (errorHandler.buildDepError "sdl3-bindgen-sys"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          pkgconfig = [
            (pkgconfPkgs."sdl3" or (errorHandler.pkgConfDepError "sdl3"))
          ];
          buildable = true;
        };
        "example-start" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."mischief-assets" or (errorHandler.buildDepError "mischief-assets"))
            (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
            (hsPkgs."mischief-input" or (errorHandler.buildDepError "mischief-input"))
            (hsPkgs."mischief-math" or (errorHandler.buildDepError "mischief-math"))
            (hsPkgs."mischief-render" or (errorHandler.buildDepError "mischief-render"))
            (hsPkgs."mischief-sdl" or (errorHandler.buildDepError "mischief-sdl"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."sdl3-bindgen-sys" or (errorHandler.buildDepError "sdl3-bindgen-sys"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          pkgconfig = [
            (pkgconfPkgs."sdl3" or (errorHandler.pkgConfDepError "sdl3"))
          ];
          buildable = true;
        };
        "example-transform" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."mischief-assets" or (errorHandler.buildDepError "mischief-assets"))
            (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
            (hsPkgs."mischief-input" or (errorHandler.buildDepError "mischief-input"))
            (hsPkgs."mischief-math" or (errorHandler.buildDepError "mischief-math"))
            (hsPkgs."mischief-render" or (errorHandler.buildDepError "mischief-render"))
            (hsPkgs."mischief-sdl" or (errorHandler.buildDepError "mischief-sdl"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."sdl3-bindgen-sys" or (errorHandler.buildDepError "sdl3-bindgen-sys"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
          pkgconfig = [
            (pkgconfPkgs."sdl3" or (errorHandler.pkgConfDepError "sdl3"))
          ];
          buildable = true;
        };
      };
      tests = {
        "mischief-test" = {
          depends = [
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
            (hsPkgs."JuicyPixels-extra" or (errorHandler.buildDepError "JuicyPixels-extra"))
            (hsPkgs."mischief-assets" or (errorHandler.buildDepError "mischief-assets"))
            (hsPkgs."mischief-ecs" or (errorHandler.buildDepError "mischief-ecs"))
            (hsPkgs."mischief-input" or (errorHandler.buildDepError "mischief-input"))
            (hsPkgs."mischief-math" or (errorHandler.buildDepError "mischief-math"))
            (hsPkgs."mischief-render" or (errorHandler.buildDepError "mischief-render"))
            (hsPkgs."mischief-sdl" or (errorHandler.buildDepError "mischief-sdl"))
            (hsPkgs."mmap" or (errorHandler.buildDepError "mmap"))
            (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
            (hsPkgs."sdl3-bindgen-sys" or (errorHandler.buildDepError "sdl3-bindgen-sys"))
            (hsPkgs."store" or (errorHandler.buildDepError "store"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
      };
    };
  }