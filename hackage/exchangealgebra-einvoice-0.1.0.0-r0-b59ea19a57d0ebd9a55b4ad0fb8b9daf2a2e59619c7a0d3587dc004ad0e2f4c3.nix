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
      specVersion = "1.18";
      identifier = { name = "exchangealgebra-einvoice"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "2026 Kaya Akagi";
      maintainer = "yakagika@icloud.com";
      author = "Kaya Akagi";
      homepage = "https://github.com/yakagika/ExchangeAlgebra#readme";
      url = "";
      synopsis = "Read UBL e-invoices (JP PINT) into exchange algebra journals";
      description = "Reads Japanese qualified invoices in the JP PINT profile of UBL 2.1 and turns each invoice into one balanced exchange algebra entry. The caller supplies the function that builds the base of each term, so the base may have elements other than the account, such as the tax rate or the counterparty. Tax-exclusive and tax-inclusive accounting are both supported.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."exchangealgebra" or (errorHandler.buildDepError "exchangealgebra"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."xml-conduit" or (errorHandler.buildDepError "xml-conduit"))
        ];
        buildable = true;
      };
      tests = {
        "exchangealgebra-einvoice-test" = {
          depends = [
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."exchangealgebra" or (errorHandler.buildDepError "exchangealgebra"))
            (hsPkgs."exchangealgebra-einvoice" or (errorHandler.buildDepError "exchangealgebra-einvoice"))
            (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."xml-conduit" or (errorHandler.buildDepError "xml-conduit"))
          ];
          buildable = true;
        };
      };
    };
  }