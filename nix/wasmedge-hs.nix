{
  "0.17.1.0" = {
    sha256 = "fe6dff8d0def0e678adbe461fb4d9d748e8b86365dd67a083b5dc09022d6c0c5";
    revisions = {
      r0 = {
        nix = import ../hackage/wasmedge-hs-0.17.1.0-r0-e023f5b0fb8edf0a54457c75288b984d15702984bc6395f9ee484c841d83afe0.nix;
        revNum = 0;
        sha256 = "e023f5b0fb8edf0a54457c75288b984d15702984bc6395f9ee484c841d83afe0";
      };
      default = "r0";
    };
  };
  "0.18.1.0" = {
    sha256 = "c78b6f51b9940d86e73dc46589bc01dc8f7dae1889ec5489a058be14bd922714";
    revisions = {
      r0 = {
        nix = import ../hackage/wasmedge-hs-0.18.1.0-r0-da906442581d4c36fb7ff1816dcf182afdfdd2c4f1167e2227758b50f30c7ffe.nix;
        revNum = 0;
        sha256 = "da906442581d4c36fb7ff1816dcf182afdfdd2c4f1167e2227758b50f30c7ffe";
      };
      default = "r0";
    };
  };
}