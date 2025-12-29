{
    description = "nvf configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nvf.url = "github:notashelf/nvf";
        utils.url = "github:numtide/flake-utils";
    };

    outputs = {nixpkgs, nvf, utils, ...}: 
        utils.lib.eachDefaultSystem (system: {
            packages.${system} = {
                default =
                    (nvf.lib.neovimConfiguration {
                        pkgs = nixpkgs.legacyPackages.${system};
                        modules = [
                            ./configuration.nix
                        ];
                    }).neovim;
            };
        });
}
