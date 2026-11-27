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
      identifier = { name = "xml-html-conduit-lens"; version = "0.4"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2013 Fumiaki Kinoshita, 2014-2016 Matvey Aksenov";
      maintainer = "Matvey Aksenov <matvey.aksenov@gmail.com>";
      author = "Fumiaki Kinoshita, Matvey Aksenov";
      homepage = "https://github.com/supki/xml-html-conduit-lens#readme";
      url = "";
      synopsis = "Optics for xml-conduit and html-conduit";
      description = "Optics for xml-conduit and html-conduit";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."xml-conduit" or (errorHandler.buildDepError "xml-conduit"))
          (hsPkgs."html-conduit" or (errorHandler.buildDepError "html-conduit"))
        ];
        buildable = true;
      };
      tests = {
        "doctest" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."doctest" or (errorHandler.buildDepError "doctest"))
          ];
          buildable = true;
        };
        "hspec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hspec-expectations-lens" or (errorHandler.buildDepError "hspec-expectations-lens"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."xml-conduit" or (errorHandler.buildDepError "xml-conduit"))
            (hsPkgs."xml-html-conduit-lens" or (errorHandler.buildDepError "xml-html-conduit-lens"))
          ];
          buildable = true;
        };
      };
    };
  }