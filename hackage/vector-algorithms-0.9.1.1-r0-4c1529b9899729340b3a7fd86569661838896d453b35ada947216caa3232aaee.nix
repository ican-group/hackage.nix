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
      boundschecks = true;
      unsafechecks = false;
      internalchecks = false;
      bench = true;
      llvm = false;
    };
    package = {
      specVersion = "1.10";
      identifier = { name = "vector-algorithms"; version = "0.9.1.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2008,2009,2010,2011,2012,2013,2014,2015 Dan Doel\n(c) 2015 Tim Baumann";
      maintainer = "Dan Doel <dan.doel@gmail.com>\nErik de Castro Lopo <erikd@mega-nerd.com>";
      author = "Dan Doel";
      homepage = "https://github.com/erikd/vector-algorithms/";
      url = "";
      synopsis = "Efficient algorithms for vector arrays";
      description = "Efficient algorithms for sorting vector arrays. At some stage\nother vector algorithms may be added.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bitvec" or (errorHandler.buildDepError "bitvec"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
        ] ++ pkgs.lib.optional (!(compiler.isGhc && compiler.version.ge "7.8")) (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"));
        buildable = true;
      };
      tests = {
        "properties" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."vector-algorithms" or (errorHandler.buildDepError "vector-algorithms"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "simple-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."mwc-random" or (errorHandler.buildDepError "mwc-random"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."vector-algorithms" or (errorHandler.buildDepError "vector-algorithms"))
          ];
          buildable = if !flags.bench then false else true;
        };
      };
    };
  }