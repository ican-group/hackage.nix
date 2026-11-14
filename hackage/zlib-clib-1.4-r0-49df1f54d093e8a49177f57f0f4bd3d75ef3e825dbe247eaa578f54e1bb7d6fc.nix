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
      specVersion = "2.4";
      identifier = { name = "zlib-clib"; version = "1.4"; };
      license = "Zlib";
      copyright = "1995-2026 Jean-loup Gailly and Mark Adler";
      maintainer = "Duncan Coutts <duncan@community.haskell.org>, Andrew Lelechenko <andrew.lelechenko@gmail.com>, Emily Pillmore <emilypi@cohomolo.gy>, Herbert Valerio Riedel <hvr@gnu.org>";
      author = "";
      homepage = "";
      url = "";
      synopsis = "zlib C library bits";
      description = "This package provides the zlib C library bits that Haskell\nbindings can use to link against.";
      buildType = "Simple";
    };
    components = { "library" = { buildable = true; }; };
  }