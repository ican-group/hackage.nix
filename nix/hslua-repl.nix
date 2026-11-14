{
  "0.1.0" = {
    sha256 = "f9cd0411522b03cba9ef1160634b2125d43d96f2cc5fa64b6c4ebed67aec43eb";
    revisions = {
      r0 = {
        nix = import ../hackage/hslua-repl-0.1.0-r0-4bd567c71b76eb96067c46e335d03e18ffbf30add8e20439acf89fb19f48cf73.nix;
        revNum = 0;
        sha256 = "4bd567c71b76eb96067c46e335d03e18ffbf30add8e20439acf89fb19f48cf73";
      };
      r1 = {
        nix = import ../hackage/hslua-repl-0.1.0-r1-95d2fc10c2f8295250646c8deefc8901ff4723860079d63b95527279161fbbe4.nix;
        revNum = 1;
        sha256 = "95d2fc10c2f8295250646c8deefc8901ff4723860079d63b95527279161fbbe4";
      };
      default = "r1";
    };
  };
  "0.1.1" = {
    sha256 = "f086b35e211975c3874185d84994d624fd542bd8860f5ed867e9067c0345f6ce";
    revisions = {
      r0 = {
        nix = import ../hackage/hslua-repl-0.1.1-r0-fc88c009353e7f248cf6553c75e55ee116ce2374f219c760e056be6ae4185cab.nix;
        revNum = 0;
        sha256 = "fc88c009353e7f248cf6553c75e55ee116ce2374f219c760e056be6ae4185cab";
      };
      default = "r0";
    };
  };
  "0.1.2" = {
    sha256 = "8244cd3ab875d922b59c77c5cf818997d3eaec492dda4a91d70914a03711c602";
    revisions = {
      r0 = {
        nix = import ../hackage/hslua-repl-0.1.2-r0-718781147963f02b4523e711f935fcae73895505d1b73e85ff17b5fb9cd3ad1a.nix;
        revNum = 0;
        sha256 = "718781147963f02b4523e711f935fcae73895505d1b73e85ff17b5fb9cd3ad1a";
      };
      r1 = {
        nix = import ../hackage/hslua-repl-0.1.2-r1-08285ac7a597e0d42ead6825b635c31003690f3ec8a503ca19ac8da5ead8f2a7.nix;
        revNum = 1;
        sha256 = "08285ac7a597e0d42ead6825b635c31003690f3ec8a503ca19ac8da5ead8f2a7";
      };
      default = "r1";
    };
  };
}