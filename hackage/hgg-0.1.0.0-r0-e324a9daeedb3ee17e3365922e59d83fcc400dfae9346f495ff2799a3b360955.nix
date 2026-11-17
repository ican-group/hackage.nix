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
    flags = { pdf = false; png = false; latex = false; "3d" = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "hgg"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2026 Aelysce Project (Toshiaki Honda)";
      maintainer = "frenzieddoll@gmail.com";
      author = "Toshiaki Honda";
      homepage = "https://github.com/frenzieddoll/hgg";
      url = "";
      synopsis = "A grammar of graphics plotting library for Haskell";
      description = "The batteries-included entry point for hgg, a Haskell-native declarative\nplotting library in the grammar-of-graphics tradition (ggplot2 /\nVega-Lite). Plots are built by monoid composition and can be bound to\ndataframes by column name.\n.\nDepending on this package brings in the core (@hgg-core@), the dataframe\nbinding (@hgg-frame@) and the SVG backend (@hgg-svg@), and exposes a\nsingle module \"Graphics.Hgg\" — one @import Graphics.Hgg@ gives you the\nEasy API, the full grammar API, the @df |>> spec@ binding and SVG save\nfunctions.\n.\n> import Graphics.Hgg\n>\n> main :: IO ()\n> main = quickScatter \"scatter.svg\" [1,2,3,4,5] [1,4,9,16,25]\n.\nOptional backends are pulled in via manual cabal flags: @pdf@\n(@hgg-pdf@), @png@ (@hgg-rasterific@), @latex@ (@hgg-latex@), @3d@\n(@hgg-3d@). Their modules (e.g. \"Graphics.Hgg.Backend.PDF\") are imported\nfrom the backend packages directly. Alternatively, depend on the backend\npackages themselves — this umbrella is a convenience, not a requirement.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = ((([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hgg-core" or (errorHandler.buildDepError "hgg-core"))
          (hsPkgs."hgg-frame" or (errorHandler.buildDepError "hgg-frame"))
          (hsPkgs."hgg-svg" or (errorHandler.buildDepError "hgg-svg"))
        ] ++ pkgs.lib.optional (flags.pdf) (hsPkgs."hgg-pdf" or (errorHandler.buildDepError "hgg-pdf"))) ++ pkgs.lib.optional (flags.png) (hsPkgs."hgg-rasterific" or (errorHandler.buildDepError "hgg-rasterific"))) ++ pkgs.lib.optional (flags.latex) (hsPkgs."hgg-latex" or (errorHandler.buildDepError "hgg-latex"))) ++ pkgs.lib.optional (flags."3d") (hsPkgs."hgg-3d" or (errorHandler.buildDepError "hgg-3d"));
        buildable = true;
      };
    };
  }