{
    description = "nvf configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nvf.url = "github:notashelf/nvf";
    };

    outputs = {nixpkgs, nvf, ...}: {
        packages.x86_64-linux = {
            default =
                (nvf.lib.neovimConfiguration {
                    pkgs = nixpkgs.legacyPackages.x86_64-linux;
                    modules = [
                        ./configuration.nix
                    ];
                }).neovim;
        };
    };
}
