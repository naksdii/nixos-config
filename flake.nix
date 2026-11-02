{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		spicetify-nix = {
			url = "github:Gerg-L/spicetify-nix";
		};
		pineconemc = {
    		url = "github:Damima3369/PineconeMC";
    		inputs.nixpkgs.follows = "nixpkgs";
  		};
	};
	outputs = { self, nixpkgs, home-manager, spicetify-nix, pineconemc,... }@inputs: 
	{
		nixosConfigurations = 
		{
			nixos = nixpkgs.lib.nixosSystem 
			{
				system = "x86_64-linux";
				modules = [
					./configuration.nix
					./environment.nix
					./hardware-configuration.nix
					./services.nix
					home-manager.nixosModules.home-manager
					{
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							users.naksdii = import ./home.nix;
							extraSpecialArgs = { inherit inputs self; };
						};
						nixpkgs.overlays = [ pineconemc.overlays.default ];
					}
				];
			};
		};
	};
}
