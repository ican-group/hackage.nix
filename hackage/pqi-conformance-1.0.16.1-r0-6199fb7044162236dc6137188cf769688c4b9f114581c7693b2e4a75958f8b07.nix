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
      specVersion = "3.0";
      identifier = { name = "pqi-conformance"; version = "1.0.16.1"; };
      license = "MIT";
      copyright = "(c) 2026, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/pqi-conformance";
      url = "";
      synopsis = "Differential conformance tests for pqi adapters";
      description = "A reusable [@hspec@](https://hackage.haskell.org/package/hspec) toolkit that checks any [@pqi@](https://hackage.haskell.org/package/pqi) adapter, given as a 'Pqi.Adapter' value, against the FFI reference adapter. It boots a throwaway PostgreSQL container (via [@testcontainers@](https://hackage.haskell.org/package/testcontainers)), runs the same operation on the candidate and the FFI connection, and asserts that the protocol-derived observations match.\n\nEach adapter's own test suite reuses these spec builders, wiring itself in as the candidate.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."postgresql-libpq" or (errorHandler.buildDepError "postgresql-libpq"))
          (hsPkgs."pqi" or (errorHandler.buildDepError "pqi"))
          (hsPkgs."testcontainers-postgresql" or (errorHandler.buildDepError "testcontainers-postgresql"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
    };
  }