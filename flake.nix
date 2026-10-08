{
    description = "Azutech NixOS Rice";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: {

        #####################
        #### HOSTS BEGIN ####
        #####################

        /* TEMPLATE
        nixosConfigurations.<HOST_NAME> = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            specialArgs = { inherit inputs; }; 

            modules = [
                ./hosts/<HOST_NAME>/config.nix
                
                ./nixos-modules/manifest.nix

                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;

                    home-manager.extraSpecialArgs = { inherit inputs; };

                    home-manager.sharedModules = [
                        ./home-modules/manifest.nix
                    ];

                    home-manager.users = {
                        <USER_NAME> = import ./users/<USER_NAME>/config.nix;
                    };

                }
            ];
        };
        */

        nixosConfigurations.atlas = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            specialArgs = { inherit inputs; }; 

            modules = [
                ./hosts/atlas/config.nix
                
                ./nixos-modules/manifest.nix

                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;

                    home-manager.extraSpecialArgs = { inherit inputs; };

                    home-manager.sharedModules = [
                        ./home-modules/manifest.nix
                    ];

                    home-manager.users = {
                        server-manager = import ./users/server-manager/config.nix;
                    };

                }
            ];
        };

        ###################
        #### HOSTS END ####
        ###################

    };
}
