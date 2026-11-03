{
  "0.1.0.0" = {
    sha256 = "bdf3e0a4d967f05810f570732ef763b3bd59e55083d16a15603068b3d6997df0";
    revisions = {
      r0 = {
        nix = import ../hackage/tap-0.1.0.0-r0-88d4fcbb79f0453f50b0e53e655a0a71d7c10f17ea9a70d0d148db4fa777aedb.nix;
        revNum = 0;
        sha256 = "88d4fcbb79f0453f50b0e53e655a0a71d7c10f17ea9a70d0d148db4fa777aedb";
      };
      default = "r0";
    };
  };
  "0.2.0.0" = {
    sha256 = "3ec9177b2fc56f57edefdca8e4d33dd52f45c7d71d5b18b51199875a476455b5";
    revisions = {
      r0 = {
        nix = import ../hackage/tap-0.2.0.0-r0-487926967ef78d2681c42c741c851232476551b557242747f515362525b53dbb.nix;
        revNum = 0;
        sha256 = "487926967ef78d2681c42c741c851232476551b557242747f515362525b53dbb";
      };
      default = "r0";
    };
  };
}