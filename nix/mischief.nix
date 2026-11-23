{
  "0.1.0.0" = {
    sha256 = "047d0c54ca784c8c1dd0f46ebf1dc10c1f9a4d091ab84108a912c6cf03cce4ae";
    revisions = {
      r0 = {
        nix = import ../hackage/mischief-0.1.0.0-r0-ba71cf84aca2241c7ce90851ae6ba04144a89452d830bb21066508cf60c9189f.nix;
        revNum = 0;
        sha256 = "ba71cf84aca2241c7ce90851ae6ba04144a89452d830bb21066508cf60c9189f";
      };
      default = "r0";
    };
  };
  "0.1.1.0" = {
    sha256 = "e709b002c052928b3c95677bf55c5c53ac6992de5a82ef175b0893174ed9e616";
    revisions = {
      r0 = {
        nix = import ../hackage/mischief-0.1.1.0-r0-def3f05df8ea405b56eecbfad7e76ecd52f1d3bb558da0883a282d9b4672c709.nix;
        revNum = 0;
        sha256 = "def3f05df8ea405b56eecbfad7e76ecd52f1d3bb558da0883a282d9b4672c709";
      };
      default = "r0";
    };
  };
}