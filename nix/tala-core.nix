{
  "0.1.0" = {
    sha256 = "72e2a9ec39ef7cf2587d55cca839abcfcbf5597145a72803d2386d0df3db0eeb";
    revisions = {
      r0 = {
        nix = import ../hackage/tala-core-0.1.0-r0-0b2c5cfdc0bc80ffea1187016e271a0a79e83e24c72837b3959f3bec330e0e50.nix;
        revNum = 0;
        sha256 = "0b2c5cfdc0bc80ffea1187016e271a0a79e83e24c72837b3959f3bec330e0e50";
      };
      default = "r0";
    };
  };
  "0.2.0" = {
    sha256 = "2b376ccc7f7c6f39866a263a3866bbfbff873747a5b80eec0011521315ca5337";
    revisions = {
      r0 = {
        nix = import ../hackage/tala-core-0.2.0-r0-8641558d18a1fceebdc18bbe7fdcd2f377070d295341bd54f38deb973f8ccbfb.nix;
        revNum = 0;
        sha256 = "8641558d18a1fceebdc18bbe7fdcd2f377070d295341bd54f38deb973f8ccbfb";
      };
      default = "r0";
    };
  };
}