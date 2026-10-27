{
  "0.0.0" = {
    sha256 = "7b0b7dfb4f7081beab54c4cb0cb3df3f3c03ce05cb11747f190bab22df19b83c";
    revisions = {
      r0 = {
        nix = import ../hackage/hpke-0.0.0-r0-8b08034f409a6db22486da680843cb6049ef25808e0ad82f5c75bc147bcc5f8f.nix;
        revNum = 0;
        sha256 = "8b08034f409a6db22486da680843cb6049ef25808e0ad82f5c75bc147bcc5f8f";
      };
      r1 = {
        nix = import ../hackage/hpke-0.0.0-r1-d04ff5eb9cdb9385ed9ad9db7e05ddf457af37cedaa3cee83f58c93e0d16364d.nix;
        revNum = 1;
        sha256 = "d04ff5eb9cdb9385ed9ad9db7e05ddf457af37cedaa3cee83f58c93e0d16364d";
      };
      default = "r1";
    };
  };
  "0.1.0" = {
    sha256 = "1a00e05c344b17f7d2b28ae19576c2aec348d71c995583f8588264a59dc87fa2";
    revisions = {
      r0 = {
        nix = import ../hackage/hpke-0.1.0-r0-fb107670a0aeb91b4626e0b1dff4e7ec3342e48931cc994938d95af1a23f645d.nix;
        revNum = 0;
        sha256 = "fb107670a0aeb91b4626e0b1dff4e7ec3342e48931cc994938d95af1a23f645d";
      };
      default = "r0";
    };
  };
  "0.2.0" = {
    sha256 = "7720e7402e5b83abbfc22ec98aa3e3ab008264e32cc06b4bcdb9de95012692dd";
    revisions = {
      r0 = {
        nix = import ../hackage/hpke-0.2.0-r0-0a38e8bb686c61576c7b23fc93cee39b0e37d9d64a11c839a239ae9edaa94384.nix;
        revNum = 0;
        sha256 = "0a38e8bb686c61576c7b23fc93cee39b0e37d9d64a11c839a239ae9edaa94384";
      };
      r1 = {
        nix = import ../hackage/hpke-0.2.0-r1-90a50806a02eaba16b557e5f22f23ce3a096781d458cff1e8c7867843811f9d7.nix;
        revNum = 1;
        sha256 = "90a50806a02eaba16b557e5f22f23ce3a096781d458cff1e8c7867843811f9d7";
      };
      default = "r1";
    };
  };
  "0.2.1" = {
    sha256 = "a9a2207dd5b0cf5180c31bc137901b0963fa9a4a89ec8b84a5ed73616fd8052a";
    revisions = {
      r0 = {
        nix = import ../hackage/hpke-0.2.1-r0-d2204dd37187e46c44511b65bfb51ed0797501da36709a42d0cd57dc988289d8.nix;
        revNum = 0;
        sha256 = "d2204dd37187e46c44511b65bfb51ed0797501da36709a42d0cd57dc988289d8";
      };
      default = "r0";
    };
  };
  "0.3.0" = {
    sha256 = "3abd965c976e9c71426bad1df7abec1881cb909dacf5d12872ec251077ba1277";
    revisions = {
      r0 = {
        nix = import ../hackage/hpke-0.3.0-r0-0559deefe454e45b4f9651856f3c0a553a285ec1ecdca13f336e0b165e408e83.nix;
        revNum = 0;
        sha256 = "0559deefe454e45b4f9651856f3c0a553a285ec1ecdca13f336e0b165e408e83";
      };
      default = "r0";
    };
  };
  "0.4.0" = {
    sha256 = "b6368ec36e0923d53bd9b054df0ae15f0d5b9499e5c23eaa205f5cc0ae34f18f";
    revisions = {
      r0 = {
        nix = import ../hackage/hpke-0.4.0-r0-8a48338c7ba01c1a6c9df695f5841efa80d60a452e63b86464f922f535252cbb.nix;
        revNum = 0;
        sha256 = "8a48338c7ba01c1a6c9df695f5841efa80d60a452e63b86464f922f535252cbb";
      };
      default = "r0";
    };
  };
}