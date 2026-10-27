{
  "0.1.0.0" = {
    sha256 = "1ae71446f23691e2af33bdaa56a6b72d6e9dbfeb3572df3ee1aae3eb87feaa6e";
    revisions = {
      r0 = {
        nix = import ../hackage/smash-aeson-0.1.0.0-r0-32d24685a44483cdbcc0a6385eec044329dcd0c8421a4ee597b84140a73f629d.nix;
        revNum = 0;
        sha256 = "32d24685a44483cdbcc0a6385eec044329dcd0c8421a4ee597b84140a73f629d";
      };
      r1 = {
        nix = import ../hackage/smash-aeson-0.1.0.0-r1-88b72d33b892d29cca1271e53fe0b7ee2465fafc0798418a4329539cfe3313f8.nix;
        revNum = 1;
        sha256 = "88b72d33b892d29cca1271e53fe0b7ee2465fafc0798418a4329539cfe3313f8";
      };
      default = "r1";
    };
  };
  "0.2.0.1" = {
    sha256 = "05d10e3c022cbee5177b3ec046341d30aa0eb864e84bd5c10e7b3a4546dd783d";
    revisions = {
      r0 = {
        nix = import ../hackage/smash-aeson-0.2.0.1-r0-60c54464f7ae2f377a8317b7038428c814f3289b1638bbb8e1d241f1b8e1013a.nix;
        revNum = 0;
        sha256 = "60c54464f7ae2f377a8317b7038428c814f3289b1638bbb8e1d241f1b8e1013a";
      };
      default = "r0";
    };
  };
  "0.3.0" = {
    sha256 = "d4d3d225b2c276c2eaeda9d951c2a9f4efc199f8219ae29a0a5ddc91d23ce251";
    revisions = {
      r0 = {
        nix = import ../hackage/smash-aeson-0.3.0-r0-0007499c69ba1672b5831a59c3edf29c96cbac6cc53d0dc0cb933dcbe6cd1a85.nix;
        revNum = 0;
        sha256 = "0007499c69ba1672b5831a59c3edf29c96cbac6cc53d0dc0cb933dcbe6cd1a85";
      };
      default = "r0";
    };
  };
}