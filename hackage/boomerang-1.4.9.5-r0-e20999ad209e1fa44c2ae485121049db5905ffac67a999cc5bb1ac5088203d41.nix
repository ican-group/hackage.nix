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
      specVersion = "1.10";
      identifier = { name = "boomerang"; version = "1.4.9.5"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "partners@seereason.com";
      author = "jeremy@seereason.com";
      homepage = "";
      url = "";
      synopsis = "Library for invertible parsing and printing";
      description = "Specify a single unified grammar which can be used for parsing and pretty-printing";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."th-abstraction" or (errorHandler.buildDepError "th-abstraction"))
        ] ++ pkgs.lib.optional (!(compiler.isGhc && compiler.version.ge "8.0")) (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))) ++ pkgs.lib.optional (!(compiler.isGhc && compiler.version.ge "9.6")) (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"));
        buildable = true;
      };
    };
  }