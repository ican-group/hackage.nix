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
    flags = { buildexamples = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "soxlib"; version = "0.0.3.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Henning Thielemann <haskell@henning-thielemann.de>";
      author = "Henning Thielemann <haskell@henning-thielemann.de>";
      homepage = "http://www.haskell.org/haskellwiki/Sox";
      url = "";
      synopsis = "Write, read, convert audio signals using libsox";
      description = "This is an FFI binding to @libsox@ of the Sox (Sound Exchanger) project\n<http://sox.sourceforge.net/>.\nIt lets write, read and convert audio signals\nin various formats, resolutions, and numbers of channels.\n\nThe package @sox@ has similar functionality\nbut calls the @sox@ shell command.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."sample-frame" or (errorHandler.buildDepError "sample-frame"))
          (hsPkgs."storablevector" or (errorHandler.buildDepError "storablevector"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."explicit-exception" or (errorHandler.buildDepError "explicit-exception"))
          (hsPkgs."extensible-exceptions" or (errorHandler.buildDepError "extensible-exceptions"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."utility-ht" or (errorHandler.buildDepError "utility-ht"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
        ];
        pkgconfig = [
          (pkgconfPkgs."sox" or (errorHandler.pkgConfDepError "sox"))
        ];
        buildable = true;
      };
      exes = {
        "soxlib-demo" = {
          depends = pkgs.lib.optionals (flags.buildexamples) [
            (hsPkgs."soxlib" or (errorHandler.buildDepError "soxlib"))
            (hsPkgs."storablevector" or (errorHandler.buildDepError "storablevector"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ];
          buildable = if flags.buildexamples then true else false;
        };
      };
    };
  }