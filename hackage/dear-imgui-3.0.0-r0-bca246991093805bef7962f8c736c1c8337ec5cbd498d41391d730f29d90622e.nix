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
    flags = { debug = false; examples = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "dear-imgui"; version = "3.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "ollie@ocharles.org.uk, aenor.realm@gmail.com";
      author = "Oliver Charles";
      homepage = "";
      url = "";
      synopsis = "Haskell bindings for Dear ImGui.";
      description = "High-level layer over the generated dear-imgui-raw bindings.\nPlatform and renderer backends are provided by the dear-imgui-impl-<backend> packages.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."dear-imgui-raw" or (errorHandler.buildDepError "dear-imgui-raw"))
          (hsPkgs."managed" or (errorHandler.buildDepError "managed"))
          (hsPkgs."StateVar" or (errorHandler.buildDepError "StateVar"))
          (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
      exes = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ] ++ pkgs.lib.optionals (!!flags.examples) [
            (hsPkgs."sdl2" or (errorHandler.buildDepError "sdl2"))
            (hsPkgs."gl" or (errorHandler.buildDepError "gl"))
            (hsPkgs."dear-imgui" or (errorHandler.buildDepError "dear-imgui"))
            (hsPkgs."dear-imgui-raw" or (errorHandler.buildDepError "dear-imgui-raw"))
            (hsPkgs."dear-imgui-impl-sdl2" or (errorHandler.buildDepError "dear-imgui-impl-sdl2"))
            (hsPkgs."dear-imgui-impl-opengl3" or (errorHandler.buildDepError "dear-imgui-impl-opengl3"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = if !flags.examples then false else true;
        };
        "glfw" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ] ++ pkgs.lib.optionals (!!flags.examples) [
            (hsPkgs."GLFW-b" or (errorHandler.buildDepError "GLFW-b"))
            (hsPkgs."gl" or (errorHandler.buildDepError "gl"))
            (hsPkgs."dear-imgui" or (errorHandler.buildDepError "dear-imgui"))
            (hsPkgs."dear-imgui-raw" or (errorHandler.buildDepError "dear-imgui-raw"))
            (hsPkgs."dear-imgui-impl-glfw" or (errorHandler.buildDepError "dear-imgui-impl-glfw"))
            (hsPkgs."dear-imgui-impl-opengl2" or (errorHandler.buildDepError "dear-imgui-impl-opengl2"))
            (hsPkgs."managed" or (errorHandler.buildDepError "managed"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.examples then false else true;
        };
        "readme" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ] ++ pkgs.lib.optionals (!!flags.examples) [
            (hsPkgs."sdl2" or (errorHandler.buildDepError "sdl2"))
            (hsPkgs."gl" or (errorHandler.buildDepError "gl"))
            (hsPkgs."dear-imgui" or (errorHandler.buildDepError "dear-imgui"))
            (hsPkgs."dear-imgui-impl-sdl2" or (errorHandler.buildDepError "dear-imgui-impl-sdl2"))
            (hsPkgs."dear-imgui-impl-opengl3" or (errorHandler.buildDepError "dear-imgui-impl-opengl3"))
            (hsPkgs."managed" or (errorHandler.buildDepError "managed"))
          ];
          buildable = if !flags.examples then false else true;
        };
        "fonts" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ] ++ pkgs.lib.optionals (!!flags.examples) [
            (hsPkgs."sdl2" or (errorHandler.buildDepError "sdl2"))
            (hsPkgs."gl" or (errorHandler.buildDepError "gl"))
            (hsPkgs."dear-imgui" or (errorHandler.buildDepError "dear-imgui"))
            (hsPkgs."dear-imgui-impl-sdl2" or (errorHandler.buildDepError "dear-imgui-impl-sdl2"))
            (hsPkgs."dear-imgui-impl-opengl2" or (errorHandler.buildDepError "dear-imgui-impl-opengl2"))
            (hsPkgs."managed" or (errorHandler.buildDepError "managed"))
          ];
          buildable = if !flags.examples then false else true;
        };
        "image" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ] ++ pkgs.lib.optionals (!!flags.examples) [
            (hsPkgs."sdl2" or (errorHandler.buildDepError "sdl2"))
            (hsPkgs."gl" or (errorHandler.buildDepError "gl"))
            (hsPkgs."dear-imgui" or (errorHandler.buildDepError "dear-imgui"))
            (hsPkgs."dear-imgui-raw" or (errorHandler.buildDepError "dear-imgui-raw"))
            (hsPkgs."dear-imgui-impl-sdl2" or (errorHandler.buildDepError "dear-imgui-impl-sdl2"))
            (hsPkgs."dear-imgui-impl-opengl3" or (errorHandler.buildDepError "dear-imgui-impl-opengl3"))
            (hsPkgs."managed" or (errorHandler.buildDepError "managed"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = if !flags.examples then false else true;
        };
        "sdlrenderer" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ] ++ pkgs.lib.optionals (!!flags.examples) [
            (hsPkgs."sdl2" or (errorHandler.buildDepError "sdl2"))
            (hsPkgs."dear-imgui" or (errorHandler.buildDepError "dear-imgui"))
            (hsPkgs."dear-imgui-impl-sdl2" or (errorHandler.buildDepError "dear-imgui-impl-sdl2"))
            (hsPkgs."dear-imgui-impl-sdlrenderer2" or (errorHandler.buildDepError "dear-imgui-impl-sdlrenderer2"))
            (hsPkgs."managed" or (errorHandler.buildDepError "managed"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = if !flags.examples then false else true;
        };
        "vulkan" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ] ++ pkgs.lib.optionals (!!flags.examples) [
            (hsPkgs."dear-imgui" or (errorHandler.buildDepError "dear-imgui"))
            (hsPkgs."dear-imgui-raw" or (errorHandler.buildDepError "dear-imgui-raw"))
            (hsPkgs."dear-imgui-impl-glfw" or (errorHandler.buildDepError "dear-imgui-impl-glfw"))
            (hsPkgs."dear-imgui-impl-vulkan" or (errorHandler.buildDepError "dear-imgui-impl-vulkan"))
            (hsPkgs."GLFW-b" or (errorHandler.buildDepError "GLFW-b"))
            (hsPkgs."JuicyPixels" or (errorHandler.buildDepError "JuicyPixels"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."vulkan" or (errorHandler.buildDepError "vulkan"))
            (hsPkgs."vulkan-init-glfw" or (errorHandler.buildDepError "vulkan-init-glfw"))
            (hsPkgs."vulkan-utils" or (errorHandler.buildDepError "vulkan-utils"))
            (hsPkgs."VulkanMemoryAllocator" or (errorHandler.buildDepError "VulkanMemoryAllocator"))
          ];
          buildable = if !flags.examples then false else true;
        };
      };
    };
  }