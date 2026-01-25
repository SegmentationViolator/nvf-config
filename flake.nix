{
    description = "nvf configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        nvf = {
            url = "github:notashelf/nvf";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.systems.follows = "systems";
        };

        systems.url = "github:nix-systems/default";
    };

    outputs = {nixpkgs, nvf, systems, ...}:
        let
            eachSystem = nixpkgs.lib.genAttrs (import systems);
        in
        {
            packages = eachSystem (system: {
                default =
                    (nvf.lib.neovimConfiguration {
                        pkgs = nixpkgs.legacyPackages.${system};
                        modules = [
                            ./configuration.nix
                        ];
                    }).neovim;
            });
        };
}
