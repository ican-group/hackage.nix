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
      identifier = { name = "text-show-instances"; version = "3.9.11"; };
      license = "BSD-3-Clause";
      copyright = "(C) 2014-2017 Ryan Scott";
      maintainer = "Ryan Scott <ryan.gl.scott@gmail.com>";
      author = "Ryan Scott";
      homepage = "https://github.com/RyanGlScott/text-show-instances";
      url = "";
      synopsis = "Additional instances for text-show";
      description = "@text-show-instances@ is a supplemental library to @text-show@\nthat provides additional @Show@ instances for data types in\ncommon Haskell libraries and GHC dependencies that are not\nencompassed by @text-show@. Currently, @text-show-instances@\ncovers these libraries:\n\n* @<https://hackage.haskell.org/package/aeson               aeson>@\n\n* @<http://hackage.haskell.org/package/bifunctors           bifunctors>@\n\n* @<http://hackage.haskell.org/package/binary               binary>@\n\n* @<http://hackage.haskell.org/package/containers           containers>@\n\n* @<http://hackage.haskell.org/package/directory            directory>@\n\n* @<http://hackage.haskell.org/package/ghc-boot-th          ghc-boot-th>@\n\n* @<http://hackage.haskell.org/package/haskeline            haskeline>@\n\n* @<http://hackage.haskell.org/package/hpc                  hpc>@\n\n* @<http://hackage.haskell.org/package/nonempty-vector      nonempty-vector>@\n\n* @<http://hackage.haskell.org/package/old-locale           old-locale>@\n\n* @<http://hackage.haskell.org/package/old-time             old-time>@\n\n* @<http://hackage.haskell.org/package/pretty               pretty>@\n\n* @<http://hackage.haskell.org/package/random               random>@\n\n* @<http://hackage.haskell.org/package/scientific           scientific>@\n\n* @<http://hackage.haskell.org/package/tagged               tagged>@\n\n* @<http://hackage.haskell.org/package/template-haskell     template-haskell>@\n\n* @<http://hackage.haskell.org/package/terminfo             terminfo>@\n\n* @<https://hackage.haskell.org/package/text-short          text-short>@\n\n* @<http://hackage.haskell.org/package/time                 time>@\n\n* @<http://hackage.haskell.org/package/transformers         transformers>@\n\n* @<http://hackage.haskell.org/package/unix                 unix>@\n\n* @<http://hackage.haskell.org/package/unordered-containers unordered-containers>@\n\n* @<https://hackage.haskell.org/package/uuid-types          uuid-types>@\n\n* @<http://hackage.haskell.org/package/vector               vector>@\n\n* @<http://hackage.haskell.org/package/Win32                Win32>@\n\n* @<http://hackage.haskell.org/package/xhtml                xhtml>@\n\nOne can use these instances by importing\n\"TextShow.Instances\". Alternatively, there are monomorphic\nversions of the @showb@ function available in the other submodules\nof \"TextShow\".";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base-compat" or (errorHandler.buildDepError "base-compat"))
          (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."ghc-boot-th" or (errorHandler.buildDepError "ghc-boot-th"))
          (hsPkgs."haskeline" or (errorHandler.buildDepError "haskeline"))
          (hsPkgs."hpc" or (errorHandler.buildDepError "hpc"))
          (hsPkgs."nonempty-vector" or (errorHandler.buildDepError "nonempty-vector"))
          (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
          (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
          (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."text-short" or (errorHandler.buildDepError "text-short"))
          (hsPkgs."text-show" or (errorHandler.buildDepError "text-show"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."uuid-types" or (errorHandler.buildDepError "uuid-types"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."xhtml" or (errorHandler.buildDepError "xhtml"))
        ] ++ (if system.isWindows
          then [ (hsPkgs."Win32" or (errorHandler.buildDepError "Win32")) ]
          else [
            (hsPkgs."terminfo" or (errorHandler.buildDepError "terminfo"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          ]);
        buildable = true;
      };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base-compat" or (errorHandler.buildDepError "base-compat"))
            (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
            (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."generic-deriving" or (errorHandler.buildDepError "generic-deriving"))
            (hsPkgs."ghc-boot-th" or (errorHandler.buildDepError "ghc-boot-th"))
            (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
            (hsPkgs."haskeline" or (errorHandler.buildDepError "haskeline"))
            (hsPkgs."hpc" or (errorHandler.buildDepError "hpc"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."nonempty-vector" or (errorHandler.buildDepError "nonempty-vector"))
            (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
            (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
            (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-instances" or (errorHandler.buildDepError "quickcheck-instances"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
            (hsPkgs."scientific" or (errorHandler.buildDepError "scientific"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            (hsPkgs."text-short" or (errorHandler.buildDepError "text-short"))
            (hsPkgs."text-show" or (errorHandler.buildDepError "text-show"))
            (hsPkgs."text-show-instances" or (errorHandler.buildDepError "text-show-instances"))
            (hsPkgs."th-orphans" or (errorHandler.buildDepError "th-orphans"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."transformers-compat" or (errorHandler.buildDepError "transformers-compat"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."uuid-types" or (errorHandler.buildDepError "uuid-types"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."xhtml" or (errorHandler.buildDepError "xhtml"))
          ] ++ (if system.isWindows
            then [ (hsPkgs."Win32" or (errorHandler.buildDepError "Win32")) ]
            else [
              (hsPkgs."terminfo" or (errorHandler.buildDepError "terminfo"))
              (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ]);
          build-tools = [
            (hsPkgs.pkgsBuildBuild.hspec-discover.components.exes.hspec-discover or (pkgs.pkgsBuildBuild.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
          ];
          buildable = true;
        };
      };
    };
  }