{
  "1.13.3" = {
    sha256 = "08d68fe36e0177d7cf7d48f82a269fcb4470f0d4d54541ef259fc23a6204ab9b";
    revisions = {
      r0 = {
        nix = import ../hackage/brillo-1.13.3-r0-80ee5b6ec249128ed11b1c5acbcaaeb7dcd749d1d2a79aaf386461b584ea93a4.nix;
        revNum = 0;
        sha256 = "80ee5b6ec249128ed11b1c5acbcaaeb7dcd749d1d2a79aaf386461b584ea93a4";
      };
      default = "r0";
    };
  };
  "2.0.0" = {
    sha256 = "bc2cdb0f7227133dc977b7d1111d87e227bcfa3b3282e2ac6fea5a326804dc7f";
    revisions = {
      r0 = {
        nix = import ../hackage/brillo-2.0.0-r0-c6b57ee1563dcb2438b25478aba9e38a87831c2f1ffb0c80b95021243aece3a3.nix;
        revNum = 0;
        sha256 = "c6b57ee1563dcb2438b25478aba9e38a87831c2f1ffb0c80b95021243aece3a3";
      };
      default = "r0";
    };
  };
  "3.0.0" = {
    sha256 = "589bbc3446248259271598633249281d353b9e3368f85c76ea44065ea93273c7";
    revisions = {
      r0 = {
        nix = import ../hackage/brillo-3.0.0-r0-0023f2cc93d0140c1017ef83ed4dddfa31b96c3190f4254579b2ac7076daa91a.nix;
        revNum = 0;
        sha256 = "0023f2cc93d0140c1017ef83ed4dddfa31b96c3190f4254579b2ac7076daa91a";
      };
      default = "r0";
    };
  };
}