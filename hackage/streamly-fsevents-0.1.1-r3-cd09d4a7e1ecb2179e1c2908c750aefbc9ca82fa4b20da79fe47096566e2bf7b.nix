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
      fusion-plugin = false;
      internal-dev = false;
      opt = true;
      limit-build-mem = false;
    };
    package = {
      specVersion = "2.2";
      identifier = { name = "streamly-fsevents"; version = "0.1.1"; };
      license = "BSD-3-Clause";
      copyright = "2025 Composewell Technologies";
      maintainer = "streamly@composewell.com";
      author = "Composewell Technologies";
      homepage = "https://streamly.composewell.com";
      url = "";
      synopsis = "File system event notification streams";
      description = "A portable, robust, and stream-based file system event notification API for\nLinux, macOS, and Windows. This library provides a streaming alternative to\nthe fsnotify package.\n\nThe portable module in this package offers a consistent,\ncross-platform, common denominator API across all supported systems\nwhereas platform-specific modules expose more extensive APIs that\nallow you to make full use of each operating system’s native\ncapabilities.";
      buildType = "Configure";
    };
    components = {
      "library" = {
        depends = ((([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
        ] ++ pkgs.lib.optional (flags.fusion-plugin) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"))) ++ pkgs.lib.optionals (system.isLinux) [
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
        ]) ++ pkgs.lib.optionals (system.isWindows) [
          (hsPkgs."Win32" or (errorHandler.buildDepError "Win32"))
          (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
        ]) ++ pkgs.lib.optional (system.isOsx) (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"));
        frameworks = pkgs.lib.optional (system.isOsx) (pkgs."Cocoa" or (errorHandler.sysDepError "Cocoa"));
        buildable = true;
      };
      tests = {
        "FileSystem.Event" = {
          depends = [
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !(system.isLinux && (compiler.isGhc && compiler.version.ge "9.4") || system.isOsx || system.isWindows)
            then false
            else true;
        };
        "FileSystem.Event.Darwin" = {
          depends = [
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !system.isOsx then false else true;
        };
        "FileSystem.Event.Linux" = {
          depends = [
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if compiler.isGhc && compiler.version.lt "9.4" || !system.isLinux
            then false
            else true;
        };
        "FileSystem.Event.Windows" = {
          depends = [
            (hsPkgs."streamly-core" or (errorHandler.buildDepError "streamly-core"))
            (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
            (hsPkgs."streamly-fsevents" or (errorHandler.buildDepError "streamly-fsevents"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          ] ++ pkgs.lib.optional (flags.fusion-plugin) (hsPkgs."fusion-plugin" or (errorHandler.buildDepError "fusion-plugin"));
          buildable = if !system.isWindows then false else true;
        };
      };
    };
  }