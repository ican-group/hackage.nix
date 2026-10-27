{
  "0.1.0.0" = {
    sha256 = "96607c195537d140c408817cb29340d5f375756b496f2a867c5ca89dc3f8abec";
    revisions = {
      r0 = {
        nix = import ../hackage/salmon-ops-0.1.0.0-r0-13f10c03fdc9a610711a1077fe7980e8397558fbc286eb3511854f7cc2421c5a.nix;
        revNum = 0;
        sha256 = "13f10c03fdc9a610711a1077fe7980e8397558fbc286eb3511854f7cc2421c5a";
      };
      default = "r0";
    };
  };
  "0.2.0.0" = {
    sha256 = "086f5013156845e47d3ffe4f4578fb391f3999b833f42857dd17d4473b5e03b9";
    revisions = {
      r0 = {
        nix = import ../hackage/salmon-ops-0.2.0.0-r0-c9d0da665ec47c9740f48e3af4a8a8c4976fd4d0c9b87fe50187129292475d12.nix;
        revNum = 0;
        sha256 = "c9d0da665ec47c9740f48e3af4a8a8c4976fd4d0c9b87fe50187129292475d12";
      };
      default = "r0";
    };
  };
}