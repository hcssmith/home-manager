{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: 
  let
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      inherit system;
    };
  in
  {
    defaultPackage.x86_64-linux = inputs.home-manager.defaultPackage.x86_64-linux;
 
    homeConfigurations = {
      "hcssmith" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
        ];
      };
    };
  };
}
