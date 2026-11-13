{
  "0.0.0.0" = {
    sha256 = "f89c5ef44ae2a554832c5863dd143d1b08fcf342af6bede1ddd8f56997817f44";
    revisions = {
      r0 = {
        nix = import ../hackage/postgresql-ltree-0.0.0.0-r0-b126daefbe6aeff874f9700466380e2b56f8b43923dc190016c8bd92ceadac87.nix;
        revNum = 0;
        sha256 = "b126daefbe6aeff874f9700466380e2b56f8b43923dc190016c8bd92ceadac87";
      };
      r1 = {
        nix = import ../hackage/postgresql-ltree-0.0.0.0-r1-960d644fd0baa00546a736b7addecf933e9eb5a9a3808ec00128a39ef8f1dd75.nix;
        revNum = 1;
        sha256 = "960d644fd0baa00546a736b7addecf933e9eb5a9a3808ec00128a39ef8f1dd75";
      };
      r2 = {
        nix = import ../hackage/postgresql-ltree-0.0.0.0-r2-ec7e5ccda73139cc9464365f5b1b5e2c181edacb03807e0926eefaa067e53525.nix;
        revNum = 2;
        sha256 = "ec7e5ccda73139cc9464365f5b1b5e2c181edacb03807e0926eefaa067e53525";
      };
      r3 = {
        nix = import ../hackage/postgresql-ltree-0.0.0.0-r3-afa7f1eb4c4b7f2c672287947b3dd15e4dc75dd49e5dbf1e6942fee156d18ad8.nix;
        revNum = 3;
        sha256 = "afa7f1eb4c4b7f2c672287947b3dd15e4dc75dd49e5dbf1e6942fee156d18ad8";
      };
      r4 = {
        nix = import ../hackage/postgresql-ltree-0.0.0.0-r4-7aaeaf026ccca5c8bdaf463bca7da0b2d3338f3e73b8c7a418570d905fdf7ee4.nix;
        revNum = 4;
        sha256 = "7aaeaf026ccca5c8bdaf463bca7da0b2d3338f3e73b8c7a418570d905fdf7ee4";
      };
      default = "r4";
    };
  };
}