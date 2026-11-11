{
  "1.0" = {
    sha256 = "2c688680f2fd1ab09fc21846b4b0e539ce9e04cfb6bc4eb7123e93d4b564acb7";
    revisions = {
      r0 = {
        nix = import ../hackage/apecs-roaring-1.0-r0-c8b0f5a5a62b82b032a5a1e93a6a7abeb88c0b3c8f405c6f22065dabc6af9847.nix;
        revNum = 0;
        sha256 = "c8b0f5a5a62b82b032a5a1e93a6a7abeb88c0b3c8f405c6f22065dabc6af9847";
      };
      r1 = {
        nix = import ../hackage/apecs-roaring-1.0-r1-314cdf4a374e4b9dc015857bd1677d68a682b21ba42e106a450fe4fe4d2c3656.nix;
        revNum = 1;
        sha256 = "314cdf4a374e4b9dc015857bd1677d68a682b21ba42e106a450fe4fe4d2c3656";
      };
      default = "r1";
    };
  };
}