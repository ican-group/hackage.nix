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
      specVersion = "1.12";
      identifier = { name = "validity"; version = "0.12.2.0"; };
      license = "MIT";
      copyright = "Copyright: (c) 2016-2021 Tom Sydney Kerckhove";
      maintainer = "syd@cs-syd.eu";
      author = "Tom Sydney Kerckhove";
      homepage = "https://github.com/NorfairKing/validity#readme";
      url = "";
      synopsis = "Validity typeclass";
      description = "For more info, see <https://github.com/NorfairKing/validity the readme>.\n\nNote: There are companion instance packages for this library:\n\n* <https://hackage.haskell.org/package/validity-aeson validity-aeson>\n\n* <https://hackage.haskell.org/package/validity-bytestring validity-bytestring>\n\n* <https://hackage.haskell.org/package/validity-containers validity-containers>\n\n* <https://hackage.haskell.org/package/validity-dlist validity-dlist>\n\n* <https://hackage.haskell.org/package/validity-path validity-path>\n\n* <https://hackage.haskell.org/package/validity-scientific validity-scientific>\n\n* <https://hackage.haskell.org/package/validity-text validity-text>\n\n* <https://hackage.haskell.org/package/validity-time validity-time>\n\n* <https://hackage.haskell.org/package/validity-unordered-containers validity-unordered-containers>\n\n* <https://hackage.haskell.org/package/validity-uuid validity-uuid>\n\n* <https://hackage.haskell.org/package/validity-vector validity-vector>";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
      };
      tests = {
        "validity-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."validity" or (errorHandler.buildDepError "validity"))
          ];
          buildable = true;
        };
      };
    };
  }