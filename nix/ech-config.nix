{
  "0.0.0" = {
    sha256 = "c442ec2344468d1a4f2147d8768569b8e34db735b161c00c59af1712ca82a1fa";
    revisions = {
      r0 = {
        nix = import ../hackage/ech-config-0.0.0-r0-6ad451f18d6a4d886546024172d6ac8e309938b92571f2a09e4f94efdb7e92b6.nix;
        revNum = 0;
        sha256 = "6ad451f18d6a4d886546024172d6ac8e309938b92571f2a09e4f94efdb7e92b6";
      };
      r1 = {
        nix = import ../hackage/ech-config-0.0.0-r1-5f27dfd23a1fb8a9130927cfc8abb98caf6e77cd992b3ec709cb6f0633396f67.nix;
        revNum = 1;
        sha256 = "5f27dfd23a1fb8a9130927cfc8abb98caf6e77cd992b3ec709cb6f0633396f67";
      };
      default = "r1";
    };
  };
  "0.0.1" = {
    sha256 = "b236b6d7ea1385c280b76051edc7d8f6db31c9cb7b35df5c06f5a0bd75b4feba";
    revisions = {
      r0 = {
        nix = import ../hackage/ech-config-0.0.1-r0-e64020ffdbaaf8734574dd8b20b8b0d4c367546db4ac2f50b4ad74f1a6447ba5.nix;
        revNum = 0;
        sha256 = "e64020ffdbaaf8734574dd8b20b8b0d4c367546db4ac2f50b4ad74f1a6447ba5";
      };
      r1 = {
        nix = import ../hackage/ech-config-0.0.1-r1-2b3eaf49d7b94bd4abdbdc1725419f1167dffe3e771a324fb0a55f438cd105cd.nix;
        revNum = 1;
        sha256 = "2b3eaf49d7b94bd4abdbdc1725419f1167dffe3e771a324fb0a55f438cd105cd";
      };
      default = "r1";
    };
  };
  "0.0.2" = {
    sha256 = "3bc6c3ff4a640fe9873d9776553d90dce5db4ee844c31133ecd8fbbb09d5567b";
    revisions = {
      r0 = {
        nix = import ../hackage/ech-config-0.0.2-r0-5ed06dae7c7a342fc16a69804d2614e4dbe68da27d5ad79d5a7d024defa67e02.nix;
        revNum = 0;
        sha256 = "5ed06dae7c7a342fc16a69804d2614e4dbe68da27d5ad79d5a7d024defa67e02";
      };
      default = "r0";
    };
  };
}