{
  "0.1.0.0" = {
    sha256 = "62b6c281d01e7a294d3d97f62de4d4fb157f4e7f4c6837ee388e054cd04ad77e";
    revisions = {
      r0 = {
        nix = import ../hackage/xch-0.1.0.0-r0-bf1a03c6fcbb22f57b7044767ea10131ecee0b14b27e17f947711cf69645c94d.nix;
        revNum = 0;
        sha256 = "bf1a03c6fcbb22f57b7044767ea10131ecee0b14b27e17f947711cf69645c94d";
      };
      default = "r0";
    };
  };
  "0.1.0.1" = {
    sha256 = "f3ecbad95acf834f4e0c894e9ee56294b39bc66a6fb78ed51917edc7641a2482";
    revisions = {
      r0 = {
        nix = import ../hackage/xch-0.1.0.1-r0-9ff65771e59046dc6e7600514cb5e4f086c181a4743b0c711bcbab9bf7818414.nix;
        revNum = 0;
        sha256 = "9ff65771e59046dc6e7600514cb5e4f086c181a4743b0c711bcbab9bf7818414";
      };
      default = "r0";
    };
  };
}