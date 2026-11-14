{
  "0.1.0.0" = {
    sha256 = "77359e945ec7727e47b4e5f1928aed40b785c495a58e5be65f61fda279ad9966";
    revisions = {
      r0 = {
        nix = import ../hackage/scxml-statecharts-0.1.0.0-r0-12c1763b646f2560e79ae060eaaa0e8b112180c7357bee2c2b016f4be5f72368.nix;
        revNum = 0;
        sha256 = "12c1763b646f2560e79ae060eaaa0e8b112180c7357bee2c2b016f4be5f72368";
      };
      r1 = {
        nix = import ../hackage/scxml-statecharts-0.1.0.0-r1-0b65fa39ee1c6579467f2369587f12c8b3ff065c546f33730b3e7cc879faa3b6.nix;
        revNum = 1;
        sha256 = "0b65fa39ee1c6579467f2369587f12c8b3ff065c546f33730b3e7cc879faa3b6";
      };
      default = "r1";
    };
  };
  "0.2.0.0" = {
    sha256 = "b2d7ece9b686bd7042fa3407e9c48810633600a36b9d9f748037ec39cbc59c42";
    revisions = {
      r0 = {
        nix = import ../hackage/scxml-statecharts-0.2.0.0-r0-38af3066b3e2ccd9f50488646c383e0730b82578d15171035ff8c37bd212fa5e.nix;
        revNum = 0;
        sha256 = "38af3066b3e2ccd9f50488646c383e0730b82578d15171035ff8c37bd212fa5e";
      };
      default = "r0";
    };
  };
  "0.3.0.0" = {
    sha256 = "dfd66fc5ae0c204b10b9b5a71c1f09f269348b9faaadd99cfc3363b1f99049b4";
    revisions = {
      r0 = {
        nix = import ../hackage/scxml-statecharts-0.3.0.0-r0-07ad9b5f424ff728e43171a51c7fe353b4d91a747d3d36a80a43ea486f9702fb.nix;
        revNum = 0;
        sha256 = "07ad9b5f424ff728e43171a51c7fe353b4d91a747d3d36a80a43ea486f9702fb";
      };
      default = "r0";
    };
  };
}