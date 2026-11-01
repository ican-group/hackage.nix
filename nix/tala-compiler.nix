{
  "0.1.0" = {
    sha256 = "9220abda1f58a1d75e7a3bb56d88432454c557dac545e448788c051e8aa13bc5";
    revisions = {
      r0 = {
        nix = import ../hackage/tala-compiler-0.1.0-r0-fcdc605da34becc9f4f15ab73e4759b0489301e92af357ddd3a854a5f4e006fc.nix;
        revNum = 0;
        sha256 = "fcdc605da34becc9f4f15ab73e4759b0489301e92af357ddd3a854a5f4e006fc";
      };
      default = "r0";
    };
  };
  "0.2.0" = {
    sha256 = "b7d6d4826914622a60a2f9e15d183cd155dc577a1b59a6c65850cb6f8f8302d9";
    revisions = {
      r0 = {
        nix = import ../hackage/tala-compiler-0.2.0-r0-210b81cc4a23b717533b0a8d5711d2a59dd89c6c1be431a83a57f364ff07b731.nix;
        revNum = 0;
        sha256 = "210b81cc4a23b717533b0a8d5711d2a59dd89c6c1be431a83a57f364ff07b731";
      };
      default = "r0";
    };
  };
}