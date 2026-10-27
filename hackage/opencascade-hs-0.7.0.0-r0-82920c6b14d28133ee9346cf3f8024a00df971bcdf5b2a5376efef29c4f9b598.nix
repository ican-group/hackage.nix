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
      identifier = { name = "opencascade-hs"; version = "0.7.0.0"; };
      license = "LGPL-2.1-only";
      copyright = "2023 Joe Warren";
      maintainer = "josephmarkwarren@gmail.com";
      author = "Joe Warren";
      homepage = "https://github.com/joe-warren/opencascade-hs#readme";
      url = "";
      synopsis = "Thin Wrapper for the OpenCASCADE CAD Kernel";
      description = "Please see the README on GitHub at <https://github.com/joe-warren/opencascade-hs#readme>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
        ];
        libs = pkgs.lib.optionals (!system.isWasm32) [
          (pkgs."stdc++" or (errorHandler.sysDepError "stdc++"))
          (pkgs."TKGeomBase" or (errorHandler.sysDepError "TKGeomBase"))
          (pkgs."TKStd" or (errorHandler.sysDepError "TKStd"))
          (pkgs."TKG3d" or (errorHandler.sysDepError "TKG3d"))
          (pkgs."TKG2d" or (errorHandler.sysDepError "TKG2d"))
          (pkgs."TKHLR" or (errorHandler.sysDepError "TKHLR"))
          (pkgs."TKMath" or (errorHandler.sysDepError "TKMath"))
          (pkgs."TKernel" or (errorHandler.sysDepError "TKernel"))
          (pkgs."TKBRep" or (errorHandler.sysDepError "TKBRep"))
          (pkgs."TKOffset" or (errorHandler.sysDepError "TKOffset"))
          (pkgs."TKFillet" or (errorHandler.sysDepError "TKFillet"))
          (pkgs."TKBO" or (errorHandler.sysDepError "TKBO"))
          (pkgs."TKPrim" or (errorHandler.sysDepError "TKPrim"))
          (pkgs."TKTopAlgo" or (errorHandler.sysDepError "TKTopAlgo"))
          (pkgs."TKDESTL" or (errorHandler.sysDepError "TKDESTL"))
          (pkgs."TKDESTEP" or (errorHandler.sysDepError "TKDESTEP"))
          (pkgs."TKDEGLTF" or (errorHandler.sysDepError "TKDEGLTF"))
          (pkgs."TKDEOBJ" or (errorHandler.sysDepError "TKDEOBJ"))
          (pkgs."TKV3d" or (errorHandler.sysDepError "TKV3d"))
          (pkgs."TKMesh" or (errorHandler.sysDepError "TKMesh"))
          (pkgs."TKRWMesh" or (errorHandler.sysDepError "TKRWMesh"))
          (pkgs."TKLCAF" or (errorHandler.sysDepError "TKLCAF"))
          (pkgs."TKXCAF" or (errorHandler.sysDepError "TKXCAF"))
          (pkgs."TKService" or (errorHandler.sysDepError "TKService"))
          (pkgs."TKShHealing" or (errorHandler.sysDepError "TKShHealing"))
          (pkgs."TKXSBase" or (errorHandler.sysDepError "TKXSBase"))
        ];
        buildable = true;
      };
    };
  }