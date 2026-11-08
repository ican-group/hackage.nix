{
  "1.0.0" = {
    sha256 = "7be783dd46d37229ea34624f5130b1e7d066f12416df69511a35d5a1ecb42af7";
    revisions = {
      r0 = {
        nix = import ../hackage/wai-effectful-1.0.0-r0-0c88eff685b228b0637967d341e831cb24c448cf8c903f208737445be8dc929f.nix;
        revNum = 0;
        sha256 = "0c88eff685b228b0637967d341e831cb24c448cf8c903f208737445be8dc929f";
      };
      r1 = {
        nix = import ../hackage/wai-effectful-1.0.0-r1-2ea90c1fd7215d47ab226e74c4ec3924661ac2cf146f629cf8599c1b1f1e15c0.nix;
        revNum = 1;
        sha256 = "2ea90c1fd7215d47ab226e74c4ec3924661ac2cf146f629cf8599c1b1f1e15c0";
      };
      default = "r1";
    };
  };
  "1.0.1" = {
    sha256 = "d392ee9740613486dbbb4800fca866131201f208a83418248ea4988862553cf7";
    revisions = {
      r0 = {
        nix = import ../hackage/wai-effectful-1.0.1-r0-0730d7cedf809fdef1eef9cbefd6f5fd172202c4bce8e5634cf5d62c8d66084a.nix;
        revNum = 0;
        sha256 = "0730d7cedf809fdef1eef9cbefd6f5fd172202c4bce8e5634cf5d62c8d66084a";
      };
      default = "r0";
    };
  };
  "1.0.2" = {
    sha256 = "ccad895cfb9d145b69e1a4f4e7cda761d23be691dd52433a31042e0698326f82";
    revisions = {
      r0 = {
        nix = import ../hackage/wai-effectful-1.0.2-r0-3923e30aee960f902d603846af2f9e323d9d6214b7aaa2f17dba8a02651dc893.nix;
        revNum = 0;
        sha256 = "3923e30aee960f902d603846af2f9e323d9d6214b7aaa2f17dba8a02651dc893";
      };
      default = "r0";
    };
  };
}