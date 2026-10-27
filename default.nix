builtins.throw ''
  This version of hackage.nix is not compatible with older versions of haskell.nix.
  Newer versions of hackage.nix are significantly smaller, and faster to download.

  However newer versions of haskell.nix are lacking high fidelity support for GHC 8.10,
  as such windows cross compilation is broken, and more may break going forward.

  You have two options:
  
  1. Please update to a newer version of haskell.nix, or

  2. If you cannot update haskell.nix it is recommended that you pin your haskell.nix
     to your current revision or `cb139fa956158397aa398186bb32dd26f7318784` and point
     hackage.nix to `github:ican-group/hackage.nix?ref=for-stackage` as shown below:

      hackageNix = {
        url = "github:ican-group/hackage.nix?ref=for-stackage";
        flake = false;
      };
  
      haskellNix = {
        # GHC 8.10.7 cross compilation for windows is broken in newer versions of haskell.nix.
        # Unpin this once we no longer need GHC 8.10.7.
        url = "github:ican-group/haskell.nix/cb139fa956158397aa398186bb32dd26f7318784";
        inputs.hackage.follows = "hackageNix";
      };

''