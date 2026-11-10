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
    flags = { sdl3 = true; };
    package = {
      specVersion = "2.2";
      identifier = { name = "dear-imgui-impl-sdlgpu3"; version = "1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "IC Rainbow <aenor.realm@gmail.com>";
      author = "";
      homepage = "";
      url = "";
      synopsis = "SDL3 GPU renderer-backend bindings for dear-imgui-raw.";
      description = "Generated with dear_bindings from the imgui_impl_sdlgpu3 backend that ships with Dear ImGui.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."dear-imgui-raw" or (errorHandler.buildDepError "dear-imgui-raw"))
        ] ++ pkgs.lib.optionals (flags.sdl3) [
          (hsPkgs."sdl3-bindgen-sys" or (errorHandler.buildDepError "sdl3-bindgen-sys"))
          (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
        ];
        pkgconfig = [
          (pkgconfPkgs."sdl3" or (errorHandler.pkgConfDepError "sdl3"))
        ];
        build-tools = [
          (hsPkgs.pkgsBuildBuild.hsc2hs.components.exes.hsc2hs or (pkgs.pkgsBuildBuild.hsc2hs or (errorHandler.buildToolDepError "hsc2hs:hsc2hs")))
        ];
        buildable = true;
      };
    };
  }