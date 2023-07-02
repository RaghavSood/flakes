{
  description = "A shell with ykman and gpg2";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:

  flake-utils.lib.eachDefaultSystem (system:
    let 
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      defaultPackage = pkgs.mkShell {
        name = "key setup shell";
        buildInputs = with pkgs; [ paperkey yubikey-manager gnupg ];
      };
    }
  );
}

