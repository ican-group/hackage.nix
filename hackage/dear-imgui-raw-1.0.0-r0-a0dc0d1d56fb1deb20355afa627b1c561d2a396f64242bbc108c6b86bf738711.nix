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
      identifier = { name = "dear-imgui-raw"; version = "1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "IC Rainbow <aenor.realm@gmail.com>";
      author = "";
      homepage = "";
      url = "";
      synopsis = "Raw FFI bindings to dear_bindings.";
      description = "Generated with dear_bindings from the docking branch of Dear ImGui. The ImGui sources are bundled, so no system library is needed.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
        ];
        libs = [ (pkgs."stdc++" or (errorHandler.sysDepError "stdc++")) ];
        build-tools = [
          (hsPkgs.pkgsBuildBuild.hsc2hs.components.exes.hsc2hs or (pkgs.pkgsBuildBuild.hsc2hs or (errorHandler.buildToolDepError "hsc2hs:hsc2hs")))
        ];
        buildable = true;
      };
    };
  }