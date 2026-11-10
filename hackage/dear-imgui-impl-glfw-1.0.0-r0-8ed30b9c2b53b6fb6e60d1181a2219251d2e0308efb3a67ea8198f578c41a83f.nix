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
    flags = { glfw-b = true; };
    package = {
      specVersion = "2.2";
      identifier = { name = "dear-imgui-impl-glfw"; version = "1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "IC Rainbow <aenor.realm@gmail.com>";
      author = "";
      homepage = "";
      url = "";
      synopsis = "GLFW backend bindings for dear-imgui-raw.";
      description = "Generated with dear_bindings from the imgui_impl_glfw backend that ships with Dear ImGui.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."dear-imgui-raw" or (errorHandler.buildDepError "dear-imgui-raw"))
        ] ++ pkgs.lib.optionals (flags.glfw-b) [
          (hsPkgs."GLFW-b" or (errorHandler.buildDepError "GLFW-b"))
          (hsPkgs."bindings-GLFW" or (errorHandler.buildDepError "bindings-GLFW"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
        ];
        pkgconfig = [
          (pkgconfPkgs."glfw3" or (errorHandler.pkgConfDepError "glfw3"))
        ];
        build-tools = [
          (hsPkgs.pkgsBuildBuild.hsc2hs.components.exes.hsc2hs or (pkgs.pkgsBuildBuild.hsc2hs or (errorHandler.buildToolDepError "hsc2hs:hsc2hs")))
        ];
        buildable = true;
      };
    };
  }