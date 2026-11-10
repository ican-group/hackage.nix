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
      specVersion = "2.2";
      identifier = { name = "dear-imgui-impl-null"; version = "1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "IC Rainbow <aenor.realm@gmail.com>";
      author = "";
      homepage = "";
      url = "";
      synopsis = "Null platform + renderer backend bindings for dear-imgui-raw.";
      description = "Generated with dear_bindings from the imgui_impl_null backend that ships with Dear ImGui.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."dear-imgui-raw" or (errorHandler.buildDepError "dear-imgui-raw"))
        ];
        build-tools = [
          (hsPkgs.pkgsBuildBuild.hsc2hs.components.exes.hsc2hs or (pkgs.pkgsBuildBuild.hsc2hs or (errorHandler.buildToolDepError "hsc2hs:hsc2hs")))
        ];
        buildable = true;
      };
    };
  }