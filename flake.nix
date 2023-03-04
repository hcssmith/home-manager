{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
 
    homeConfigurations = {
      "hcssmith" = inputs.home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linus";
        homeDirectory = "/var/home/hcssmith";
        username = "hcssmith";
        configuration.imports = [ ./home.nix ];
      };
    };
  };
}
