{
  "0.1.0.0" = {
    sha256 = "651f715b97e3ea2a6738c93cf1ecf9edabfdbe4240a0ce6bd8492e5acb57df04";
    revisions = {
      r0 = {
        nix = import ../hackage/acme-not-a-joke-0.1.0.0-r0-460e33e9fcf0d39fb08e360b733374e26c6b48b1c0b803a196e1db3f23486653.nix;
        revNum = 0;
        sha256 = "460e33e9fcf0d39fb08e360b733374e26c6b48b1c0b803a196e1db3f23486653";
      };
      r1 = {
        nix = import ../hackage/acme-not-a-joke-0.1.0.0-r1-980a82a0ec228969af2f17a0443bdf1861855e94bab76814b18595349dd67ecc.nix;
        revNum = 1;
        sha256 = "980a82a0ec228969af2f17a0443bdf1861855e94bab76814b18595349dd67ecc";
      };
      r2 = {
        nix = import ../hackage/acme-not-a-joke-0.1.0.0-r2-57fbd99c6ed98416d558652cca4d6bec4786f763dc8145b36090376afe4e3fc8.nix;
        revNum = 2;
        sha256 = "57fbd99c6ed98416d558652cca4d6bec4786f763dc8145b36090376afe4e3fc8";
      };
      default = "r2";
    };
  };
  "0.2.0.0" = {
    sha256 = "46656b7bee08b4f455e0b3a20366e39259c434c923dda6f39c1053ac356a9562";
    revisions = {
      r0 = {
        nix = import ../hackage/acme-not-a-joke-0.2.0.0-r0-8b65c076fa1b406a255912104f0e20f3c3cfdba9975b20880031d8b67c115eb8.nix;
        revNum = 0;
        sha256 = "8b65c076fa1b406a255912104f0e20f3c3cfdba9975b20880031d8b67c115eb8";
      };
      default = "r0";
    };
  };
}