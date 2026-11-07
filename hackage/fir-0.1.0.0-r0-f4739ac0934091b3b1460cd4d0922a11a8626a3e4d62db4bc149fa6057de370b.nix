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
    flags = { internals = false; sop = false; };
    package = {
      specVersion = "3.0";
      identifier = { name = "fir"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "sam.derbyshire@gmail.com";
      author = "Sam Derbyshire";
      homepage = "https://gitlab.com/sheaf/fir";
      url = "";
      synopsis = "An EDSL that compiles to SPIR-V for graphics programming on the GPU in Haskell.";
      description = "<<img/FIR_logo.svg>>\n\n[__FIR__](https://gitlab.com/sheaf/fir) is an EDSL\nfor writing GPU shader code in Haskell, compiled to __@SPIR-V@__.\nRequires GHC >= 8.10.\n\nWith this library, shader programs can be written using @do@ notation.\nSuch programs are then transformed into abstract syntax trees (ASTs),\nbefore being compiled to @SPIR-V@ assembly.\n\nIn effect, this replaces @GLSL@ as a shader language.\nThis means the Haskell type-system and type-checker are put to use\nin verifying programs at compile-time.\nFunctional idioms, such as functor and applicative operations, are also supported.\n\nSee the [fir-examples](https://gitlab.com/sheaf/fir/tree/0.1/fir-examples)\nproject subdirectory for fleshed out examples,\nincluding using the @vulkan@ package for rendering.\n\nThe exposed modules are:\n\n[\"FIR\"]\n    Re-exports the main functionality of the library: writing and compiling programs.\n\n\n[\"FIR.Syntax.Labels\"]\n    Optional imperative-like syntax using /OverloadedLabels/.\n\n\n[\"Math.Linear\"]\n    Vectors, matrices, and operations on them, as used by this library.\n\n\n[\"Math.Quaternion\"]\n    Quaternions and their action by conjugation in 3 dimensions, useful for 3D cameras.\n\n\n\nImportant types used by this library:\n\n[@Code a@]\n\n    Code for a pure value of type @a@, represented internally as an abstract syntax tree.\n    See \"FIR.AST\".\n\n    Overloaded functions are provided that automatically create and combine terms of this type.\n    For instance, @3 + 5 :: Code Float@ gets desugared to @PrimOp FAdd ( Lit 3.0 ) ( Lit 5.0 )@.\n\n[@Program i j a@]\n\n    A monadic expression, starting in state @i@ and ending in state @j@.\n    This state is used to keep track of information at the type level,\n    allowing for type errors to be thrown on invalid operations\n    (e.g. writing to a read-only variable, image sampling outside a fragment shader, etc).\n\n    A value of type @Program i j (Code a)@ can be thought of as stateful GPU code\n    producing a value of type @a@.\n\n    Internally represented using the codensity transformation of McBride-style indexed monads, see \"Control.Monad.Indexed\".\n\n[@Module defs@]\n\n    Code for a program that can be compiled to a @SPIR-V@ module.\n\n    @defs@ is a type-level list of shader inputs/ouputs (uniforms, varyings, etc),\n    top-level functions, and entry points.\n\n    See \"FIR.Module\" for the definition, and the [example shaders](https://gitlab.com/sheaf/fir/tree/0.1/fir-examples/readme.md#overview)\n    for common usage patterns.\n\n\nValues of all three of these types can be displayed graphically as trees using @showAST@/@drawAST@,\nwhich can be useful for debugging.\n\nSee the [project readme](https://gitlab.com/sheaf/fir/tree/0.1/readme.md) for further information,\nas well as the [\"getting started\" guide](https://gitlab.com/sheaf/fir/tree/0.1/getting_started.md),\nwhich includes instructions concerning installation and usage of the library, and of useful tools\nsuch as the @SPIR-V@ tools provided by the [Vulkan SDK](https://www.lunarg.com/vulkan-sdk/).";
      buildType = "Simple";
    };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."atomic-file-ops" or (errorHandler.buildDepError "atomic-file-ops"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."distributive" or (errorHandler.buildDepError "distributive"))
          (hsPkgs."finite-typelits" or (errorHandler.buildDepError "finite-typelits"))
          (hsPkgs."generic-monoid" or (errorHandler.buildDepError "generic-monoid"))
          (hsPkgs."ghc-typelits-knownnat" or (errorHandler.buildDepError "ghc-typelits-knownnat"))
          (hsPkgs."ghc-typelits-natnormalise" or (errorHandler.buildDepError "ghc-typelits-natnormalise"))
          (hsPkgs."half" or (errorHandler.buildDepError "half"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."text-short" or (errorHandler.buildDepError "text-short"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."tree-view" or (errorHandler.buildDepError "tree-view"))
          (hsPkgs."typelits-witnesses" or (errorHandler.buildDepError "typelits-witnesses"))
          (hsPkgs."variant" or (errorHandler.buildDepError "variant"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."vector-sized" or (errorHandler.buildDepError "vector-sized"))
        ] ++ pkgs.lib.optionals (flags.sop) [
          (hsPkgs."generics-sop" or (errorHandler.buildDepError "generics-sop"))
          (hsPkgs."sop-core" or (errorHandler.buildDepError "sop-core"))
        ];
        buildable = true;
      };
      tests = {
        "fir-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."fir" or (errorHandler.buildDepError "fir"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
          ];
          buildable = true;
        };
      };
    };
  }