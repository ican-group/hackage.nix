{
  "0.1.0.0" = {
    sha256 = "b2d766d87b7d06636fbf1eb67f57d81cf19018cda5fcf29faafb837e5ec8da21";
    revisions = {
      r0 = {
        nix = import ../hackage/salmon-apps-0.1.0.0-r0-336935c79e449ab211a2fe8d95179cbd01a756f9d97e0944438845fcca4b6dc8.nix;
        revNum = 0;
        sha256 = "336935c79e449ab211a2fe8d95179cbd01a756f9d97e0944438845fcca4b6dc8";
      };
      default = "r0";
    };
  };
  "0.2.0.0" = {
    sha256 = "be845cbfd26452154910b3887f66ebe268f5e4ad7a1f7a4751db26d7dfc79058";
    revisions = {
      r0 = {
        nix = import ../hackage/salmon-apps-0.2.0.0-r0-a8240e42757b4e33b0da7f5b308d5086f11f9135f71c7b35ec4fc33e8a8a7450.nix;
        revNum = 0;
        sha256 = "a8240e42757b4e33b0da7f5b308d5086f11f9135f71c7b35ec4fc33e8a8a7450";
      };
      default = "r0";
    };
  };
}