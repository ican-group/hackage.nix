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
      identifier = { name = "pqi"; version = "1.1.0.2"; };
      license = "MIT";
      copyright = "(c) 2026, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/pqi";
      url = "";
      synopsis = "Driver-agnostic interface to the PostgreSQL libpq API";
      description = "@pqi@ reproduces the API surface of the [@postgresql-libpq@](https://hackage.haskell.org/package/postgresql-libpq) package, but\nreifies the connection (and its results) as a plain record of closures\ninstead of a single concrete type tied to @libpq@. This lets callers\nprogram against one interface and pick an adapter package to construct it:\n\n* [@pqi-ffi@](https://hackage.haskell.org/package/pqi-ffi) - a thin adapter backed by the C @libpq@ library via\n  [@postgresql-libpq@](https://hackage.haskell.org/package/postgresql-libpq).\n\n* [@pqi-native@](https://hackage.haskell.org/package/pqi-native) - a pure-Haskell adapter that speaks the PostgreSQL wire\n  protocol directly. __Alpha__, and fully interchangeable with @pqi-ffi@: switching between them\n  is a one-line @Adapter@ change.\n\nThis package ships only the interface: the record types, and an 'Adapter' type for adapter packages to bundle their\nconnection-establishing functions under.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
        ];
        buildable = true;
      };
    };
  }