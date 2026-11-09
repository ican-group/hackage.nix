{
  "1.1.1" = {
    sha256 = "2f07c78627ad573e9f2796f2e3f7c4f9af2ea1db61e2d53bb4bea8d452c28086";
    revisions = {
      r0 = {
        nix = import ../hackage/hs-hath-1.1.1-r0-e8105cc1046ded50b6e8dfb7d73b6055c5d4ee6f77a7fca931f1fa9bf3c32cc4.nix;
        revNum = 0;
        sha256 = "e8105cc1046ded50b6e8dfb7d73b6055c5d4ee6f77a7fca931f1fa9bf3c32cc4";
      };
      default = "r0";
    };
  };
  "1.1.2" = {
    sha256 = "aca66f370db035eb1ba32f9e6bee3618afc17f97486123a47de3e9649902f923";
    revisions = {
      r0 = {
        nix = import ../hackage/hs-hath-1.1.2-r0-aa757288ecefc628d41822d9652f499e8ab02e43f249b6ccffa5ef06a3d63f36.nix;
        revNum = 0;
        sha256 = "aa757288ecefc628d41822d9652f499e8ab02e43f249b6ccffa5ef06a3d63f36";
      };
      default = "r0";
    };
  };
  "1.2.0" = {
    sha256 = "7b764cb6605c61618e503d19ebb213fca237335ea64d90d34a53b6f8ab2c7603";
    revisions = {
      r0 = {
        nix = import ../hackage/hs-hath-1.2.0-r0-2672410e6789b7a007cf964891a2d1a7a4a8bf0b80303a72856682cad539ccc1.nix;
        revNum = 0;
        sha256 = "2672410e6789b7a007cf964891a2d1a7a4a8bf0b80303a72856682cad539ccc1";
      };
      r1 = {
        nix = import ../hackage/hs-hath-1.2.0-r1-dfd3e331bb403d2a99b54f85d8d9dca50a9f6e53a7ceb0948c90fbbba9b8ef7f.nix;
        revNum = 1;
        sha256 = "dfd3e331bb403d2a99b54f85d8d9dca50a9f6e53a7ceb0948c90fbbba9b8ef7f";
      };
      default = "r1";
    };
  };
}