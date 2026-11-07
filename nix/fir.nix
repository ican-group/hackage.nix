{
  "0.1.0.0" = {
    sha256 = "ae378919d82acd8b311b1a972d090e4a65491352bb915fe2d28d0b7f22f94d7e";
    revisions = {
      r0 = {
        nix = import ../hackage/fir-0.1.0.0-r0-f4739ac0934091b3b1460cd4d0922a11a8626a3e4d62db4bc149fa6057de370b.nix;
        revNum = 0;
        sha256 = "f4739ac0934091b3b1460cd4d0922a11a8626a3e4d62db4bc149fa6057de370b";
      };
      r1 = {
        nix = import ../hackage/fir-0.1.0.0-r1-95a420807dab283c00482ff72b80d1a3794ad39f1bfb67fdb916102e973fb586.nix;
        revNum = 1;
        sha256 = "95a420807dab283c00482ff72b80d1a3794ad39f1bfb67fdb916102e973fb586";
      };
      default = "r1";
    };
  };
}