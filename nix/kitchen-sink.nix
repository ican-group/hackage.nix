{
  "0.1.0.0" = {
    sha256 = "27db45dca2ad7b159317cde0152c4b69424861c2c4c2bb460b9f3042d7c03168";
    revisions = {
      r0 = {
        nix = import ../hackage/kitchen-sink-0.1.0.0-r0-9372019441f152948336677836f0663e2538f9b8069bcc7a320eb3d81082a8b3.nix;
        revNum = 0;
        sha256 = "9372019441f152948336677836f0663e2538f9b8069bcc7a320eb3d81082a8b3";
      };
      default = "r0";
    };
  };
  "0.2.0.0" = {
    sha256 = "f437c84ad94e1a8835101768ee39550ecf54899ab682da391052584ec645332d";
    revisions = {
      r0 = {
        nix = import ../hackage/kitchen-sink-0.2.0.0-r0-0a752e7f985edfdeced175be8b97aaf2dd830f2208dc9cafd02bad1532e9b171.nix;
        revNum = 0;
        sha256 = "0a752e7f985edfdeced175be8b97aaf2dd830f2208dc9cafd02bad1532e9b171";
      };
      default = "r0";
    };
  };
}