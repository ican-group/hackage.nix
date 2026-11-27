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
      identifier = { name = "text-builder"; version = "1.0.0.6"; };
      license = "MIT";
      copyright = "(c) 2017, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/text-builder";
      url = "";
      synopsis = "Efficient and flexible strict text builder";
      description = "= Summary\n\nFast strict text builder and simple type-safe formatting library.\n\n== The Builder\n\nThe builder abstraction provided by this library is much faster than the standard lazy @Builder@ and even the recently introduced @StrictTextBuilder@ from \\\"text\\\". Benchmarks are distributed with the source code. You can see the results in the README file.\n\nThe abstraction constructs text in two phases. In the first one it estimates the size of the byte array and in the second one it allocates it once and populates it in one go.\n\n== Simple and type-safe formatting library\n\nThe monoidal API of the library provides a simple yet type-safe alternative to formatting strings via @printf@-like tools or more involved solutions like the popular \\\"[formatting](https://hackage.haskell.org/package/formatting)\\\" library.\n\n== Quality\n\nEvery bit of the library is heavily covered with tests with CI running tests on a variety of versions of GHC and the \\\"text\\\" library. This is crucial because the \\\"text\\\" library has made a switch from UTF-16 to UTF-8, leading to drastic changes in its low-level constructs, which builder libraries must rely on, and this library supports both versions of \\\"text\\\".\n\n= Ecosystem\n\nFollowing is a list of libraries that, alongside this one, make an integrated ecosystem:\n\n- \"[text-builder-time](https://hackage.haskell.org/package/text-builder-time)\" - formatters for the \"time\" library\n\n- \"[text-builder-core](https://hackage.haskell.org/package/text-builder-core)\" - lower-level unsafe constructs for implementing efficient formatters compatible with this library\n\n- \"[text-builder-dev](https://hackage.haskell.org/package/text-builder-dev)\" - edge of development of new features providing a richer functionality at the cost of more frequent major releases\n\n- \"[text-builder-lawful-conversions](https://hackage.haskell.org/package/text-builder-lawful-conversions)\" - integration with the \\\"lawful-conversions\\\" library, providing bidirectional conversions with various textual and builder types.";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."text-builder-core" or (errorHandler.buildDepError "text-builder-core"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
        ];
        buildable = true;
      };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-classes" or (errorHandler.buildDepError "quickcheck-classes"))
            (hsPkgs."quickcheck-instances" or (errorHandler.buildDepError "quickcheck-instances"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-builder" or (errorHandler.buildDepError "text-builder"))
          ];
          buildable = true;
        };
      };
      benchmarks = {
        "bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."tasty-bench" or (errorHandler.buildDepError "tasty-bench"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."text-builder" or (errorHandler.buildDepError "text-builder"))
            (hsPkgs."text-builder-linear" or (errorHandler.buildDepError "text-builder-linear"))
          ];
          buildable = true;
        };
      };
    };
  }