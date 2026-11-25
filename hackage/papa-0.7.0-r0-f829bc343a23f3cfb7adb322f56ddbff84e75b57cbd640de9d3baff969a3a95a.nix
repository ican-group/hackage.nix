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
    flags = { dev = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "papa"; version = "0.7.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2016-2017 Commonwealth Scientific and Industrial Research Organisation (CSIRO) ABN 41 687 119 230\nCopyright (c) 2017-2026 Tony Morris";
      maintainer = "Tony Morris <ʇǝu˙sıɹɹoɯʇ@ןןǝʞsɐɥ> <dibblego>";
      author = "Tony Morris <ʇǝu˙sıɹɹoɯʇ@ןןǝʞsɐɥ> <dibblego>";
      homepage = "https://gitlab.com/system-f/code/papa";
      url = "";
      synopsis = "Type class-driven prelude with lens, comonads, and safe alternatives";
      description = "<<https://logo.systemf.com.au/systemf-450x450.png>>\n\nPapa is a Haskell prelude that replaces the partial functions of Prelude\nwith total ones, generalises the familiar names to type classes, and\nbrings in lens, semigroupoids, bifunctors and comonad.\n\n= Total replacements\n\nTotal division takes a @NonZero@ divisor, checked once by\n@preview nonZero@ (@divNonZero@, @divideNonZero@, @ratioNonZero@, ...), and\n@pow@ a @Natural@ exponent, and @intCast@ converts between integral types\nonly where no value can be lost; Prelude's partial versions, with\n@fromIntegral@, are in the separate module @Papa.Unsafe.Numeric@. Elsewhere, where Prelude throws, Papa returns a\n@Maybe@: @cycle@ (empty list), @(!!)@, @(!?)@ (index out of range), @chr@,\n@succ@, @pred@ (out of range), @stimes@ (count out of range) and @readIO@\n(no parse). On any @Foldable1@, @maximum@, @minimum@, @maximumBy@ and\n@minimumBy@ need no @Maybe@, and @head@, @tail@, @last@ and @init@ are\nlenses into a @NonEmpty@.\n\n@fromJust@, @read@, @error@, @undefined@, @throw@, @foldl1@, @foldr1@,\n@truncate@, @round@, @realToFrac@ and every @unsafe*@ function are not\nexported (@truncateMaybe@, @roundMaybe@, @floatToDouble@, ... instead); a\ntest fails to compile if they are.\n\n= Text first, and I/O errors as values\n\n@putStrLn@, @readFile@, @print@, @lines@, @words@ and the rest are\n@Text@'s, read and write UTF-8 whatever the locale, read strictly, and\nreturn their @IOException@ in @IOExcept@ (@ExceptT IOException IO@) rather\nthan throw it. @catch@, @try@ and @bracket@ never catch an asynchronous\nexception. The functions of text, bytestring, containers, vector and\nunordered-containers are wrapped, imported qualified, with a total\nfunction of the same name for each one that throws.\n\n= Generalised names\n\n@map@ is @fmap@, @(++)@ is @(<>)@, @const@ is @pure@, @mapM@ is\n@traverse@, @fst@ and @snd@ work on any tuple, @lookup@ and\n@partitionEithers@ work on any @Foldable@, and @lefts@ and @rights@ are\ntraversals.\n\n= Usage\n\n> {-# LANGUAGE NoImplicitPrelude #-}\n> import Papa\n>\n> average :: [Int] -> Maybe Int\n> average xs = fmap (divNonZero (sum xs)) (preview nonZero (length xs))\n\nSee \"Papa\" for the modules that import alongside it, and those to import\nqualified.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."adjunctions" or (errorHandler.buildDepError "adjunctions"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."associative" or (errorHandler.buildDepError "associative"))
          (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
          (hsPkgs."comonad" or (errorHandler.buildDepError "comonad"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."distributive" or (errorHandler.buildDepError "distributive"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."free" or (errorHandler.buildDepError "free"))
          (hsPkgs."id" or (errorHandler.buildDepError "id"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."one" or (errorHandler.buildDepError "one"))
          (hsPkgs."polytree" or (errorHandler.buildDepError "polytree"))
          (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
          (hsPkgs."selective" or (errorHandler.buildDepError "selective"))
          (hsPkgs."semigroupoids" or (errorHandler.buildDepError "semigroupoids"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."witherable" or (errorHandler.buildDepError "witherable"))
        ];
        buildable = true;
      };
      tests = {
        "hedgehog" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hedgehog" or (errorHandler.buildDepError "hedgehog"))
            (hsPkgs."hedgehog-fn" or (errorHandler.buildDepError "hedgehog-fn"))
            (hsPkgs."papa" or (errorHandler.buildDepError "papa"))
            (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
          buildable = true;
        };
        "inspection" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."inspection-testing" or (errorHandler.buildDepError "inspection-testing"))
            (hsPkgs."papa" or (errorHandler.buildDepError "papa"))
          ];
          buildable = true;
        };
        "doctest" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
          ];
          build-tools = [
            (hsPkgs.pkgsBuildBuild.doctest.components.exes.doctest or (pkgs.pkgsBuildBuild.doctest or (errorHandler.buildToolDepError "doctest:doctest")))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "papa-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."papa" or (errorHandler.buildDepError "papa"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
          buildable = true;
        };
      };
    };
  }