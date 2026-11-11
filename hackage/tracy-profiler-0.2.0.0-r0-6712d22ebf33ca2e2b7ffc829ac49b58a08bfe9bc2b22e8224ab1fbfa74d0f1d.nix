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
      enable = false;
      fibers = false;
      has_callstack = false;
      manual_lifetime = false;
      on_demand = false;
      zones_pedantic = true;
      zones_unsafe = false;
    };
    package = {
      specVersion = "2.2";
      identifier = { name = "tracy-profiler"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2025 IC Rainbow";
      maintainer = "aenor.realm@gmail.com";
      author = "IC Rainbow";
      homepage = "https://github.com/haskell-game/tracy-profiler#readme";
      url = "";
      synopsis = "Haskell bindings for Tracy frame profiler";
      description = "";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
          (hsPkgs."webcolor-labels" or (errorHandler.buildDepError "webcolor-labels"))
        ];
        libs = pkgs.lib.optionals (flags.enable) [
          (pkgs."TracyClient" or (errorHandler.sysDepError "TracyClient"))
          (pkgs."stdc++" or (errorHandler.sysDepError "stdc++"))
        ];
        buildable = true;
      };
      tests = {
        "tracy-profiler-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."tracy-profiler" or (errorHandler.buildDepError "tracy-profiler"))
            (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
          ];
          buildable = true;
        };
      };
    };
  }