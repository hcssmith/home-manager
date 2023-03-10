{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR/master";
    # Set to local path when testing.
    my-nix-overlay = {
      #url = "path:/var/home/hcssmith/Projects/my-nix-overlay";
      url = "github:hcssmith/my-nix-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: 
  let
    system = "x86_64-linux";
    overlays = [
      inputs.my-nix-overlay.overlay
      inputs.nur.overlay
    ];
    pkgs = import inputs.nixpkgs {
      inherit system;
      inherit overlays;
      config = {
        allowUnfree = true;
      };
    };
  in
  {
    defaultPackage.x86_64-linux = inputs.home-manager.defaultPackage.x86_64-linux;
 
    homeConfigurations = {
      "hcssmith" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          ./plan9
          ./bash
          ./neovim
          ./global_packages
          ./hcssmith
          ./git
          ./firefox
        ];
      };
    };
  };
}
