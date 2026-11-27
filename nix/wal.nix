{
  "0.1.0.0" = {
    sha256 = "885b5f83a59e057a6727e29224383239d460305077187bbe9abf143251edea26";
    revisions = {
      r0 = {
        nix = import ../hackage/wal-0.1.0.0-r0-baa15b5405aec49064ac92ded6433cae9d805ab6a86cd6b9c8384dbcdb41c8af.nix;
        revNum = 0;
        sha256 = "baa15b5405aec49064ac92ded6433cae9d805ab6a86cd6b9c8384dbcdb41c8af";
      };
      r1 = {
        nix = import ../hackage/wal-0.1.0.0-r1-e421e02e6e6cdd52a739c4de1d34358fe00e611580ed42eb7f1dc9aad0bd9a85.nix;
        revNum = 1;
        sha256 = "e421e02e6e6cdd52a739c4de1d34358fe00e611580ed42eb7f1dc9aad0bd9a85";
      };
      default = "r1";
    };
  };
  "0.1.0.1" = {
    sha256 = "0834edd406ef2f27452dd7c8b46bea1851256ed71ee517b5b0051f7a420ecb7e";
    revisions = {
      r0 = {
        nix = import ../hackage/wal-0.1.0.1-r0-0457c7b109622d75e33b2c5e01f2df027819393e93d49b99ac7f91a888aeeac0.nix;
        revNum = 0;
        sha256 = "0457c7b109622d75e33b2c5e01f2df027819393e93d49b99ac7f91a888aeeac0";
      };
      default = "r0";
    };
  };
}