{
  "1.0.0.0" = {
    sha256 = "c6007da82cb8375a02e775f2be38b102a5dfc1a27a8c8a6eb900bded41acbd21";
    revisions = {
      r0 = {
        nix = import ../hackage/dataframe-arrow-bridge-1.0.0.0-r0-24026b0978733579b76b1539d34aa48c2278167d9ed167048135a780a6dc4802.nix;
        revNum = 0;
        sha256 = "24026b0978733579b76b1539d34aa48c2278167d9ed167048135a780a6dc4802";
      };
      r1 = {
        nix = import ../hackage/dataframe-arrow-bridge-1.0.0.0-r1-e7025901ce0feb954b98e3d24990b737a7d7cb8911b64b2facc3dde97abd7da0.nix;
        revNum = 1;
        sha256 = "e7025901ce0feb954b98e3d24990b737a7d7cb8911b64b2facc3dde97abd7da0";
      };
      default = "r1";
    };
  };
  "1.1.0.0" = {
    sha256 = "7dc0b6abc5106077fb4bb3670405a1173802ac1daaa0a66205e5c510c0d1361a";
    revisions = {
      r0 = {
        nix = import ../hackage/dataframe-arrow-bridge-1.1.0.0-r0-1279f47eb943c2f667dba48a3ecb1236845dc547e62f29aef04c3cc1bc0bb949.nix;
        revNum = 0;
        sha256 = "1279f47eb943c2f667dba48a3ecb1236845dc547e62f29aef04c3cc1bc0bb949";
      };
      default = "r0";
    };
  };
  "1.1.0.1" = {
    sha256 = "02f778c896fe295be8deb15b58a2fc13afc250cabbb057108c760b2a3eb12bd9";
    revisions = {
      r0 = {
        nix = import ../hackage/dataframe-arrow-bridge-1.1.0.1-r0-a25b6e2926ccaf4ffe33e49b86831b048d5de2d3d02b5856418c6ee081925cf6.nix;
        revNum = 0;
        sha256 = "a25b6e2926ccaf4ffe33e49b86831b048d5de2d3d02b5856418c6ee081925cf6";
      };
      default = "r0";
    };
  };
}