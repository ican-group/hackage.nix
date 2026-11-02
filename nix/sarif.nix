{
  "0.1" = {
    sha256 = "1b442c096fb1a8618a8419b7f026412463078f03502c0251e4bed42de074299e";
    revisions = {
      r0 = {
        nix = import ../hackage/sarif-0.1-r0-366bd60cc24286a3313b78613fb0339d86d9863eceddd5c53c25cbd2db3872c8.nix;
        revNum = 0;
        sha256 = "366bd60cc24286a3313b78613fb0339d86d9863eceddd5c53c25cbd2db3872c8";
      };
      default = "r0";
    };
  };
  "0.2" = {
    sha256 = "b94f3e8cab2402b03d5c203256969409fe8d8366dc5c64de3b2258c24c32b184";
    revisions = {
      r0 = {
        nix = import ../hackage/sarif-0.2-r0-70a70ce8f01bd2c2a27508eca465393b7e6b9ec3ecefc4bb0a2d6b013dd09088.nix;
        revNum = 0;
        sha256 = "70a70ce8f01bd2c2a27508eca465393b7e6b9ec3ecefc4bb0a2d6b013dd09088";
      };
      default = "r0";
    };
  };
}