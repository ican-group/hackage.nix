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
      specVersion = "2.0";
      identifier = { name = "fedora-krb"; version = "0.1.1"; };
      license = "GPL-2.0-only";
      copyright = "2024-2026  Jens Petersen <petersen@redhat.com>";
      maintainer = "Jens Petersen <petersen@redhat.com>";
      author = "Jens Petersen <petersen@redhat.com>";
      homepage = "https://github.com/juhp/fedora-krb";
      url = "";
      synopsis = "Kerberos for Fedora packagers";
      description = "A small library wrapping fkinit for Fedora developers.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
          (hsPkgs."simple-cmd" or (errorHandler.buildDepError "simple-cmd"))
          (hsPkgs."simple-prompt" or (errorHandler.buildDepError "simple-prompt"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
        ];
        buildable = true;
      };
    };
  }