{
    description = "nvf configuration";

    inputs = {
        flake-parts.url = "github:hercules-ci/flake-parts";

        import-tree.url = "github:vic/import-tree";

        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        nvf = {
            url = "github:notashelf/nvf";
            inputs = {
                flake-parts.follows = "flake-parts";
                nixpkgs.follows = "nixpkgs";
                systems.follows = "systems";
            };
        };

        systems.url = "github:nix-systems/default";
    };

    outputs = { flake-parts, import-tree, systems,... } @ inputs:
        flake-parts.lib.mkFlake { inherit inputs; } {
            inherit (import systems) systems;
            imports = import-tree ./modules;
        };
}
