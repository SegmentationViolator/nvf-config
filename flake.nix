{
    description = "nvf configuration";

    inputs = {
        flake-parts.url = "github:hercules-ci/flake-parts";

        import-tree.url = "github:vic/import-tree";

        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        nvf = {
            url = "github:notashelf/nvf";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.systems.follows = "systems";
        };

        systems.url = "github:nix-systems/x86_64-linux";
    };

    outputs = { flake-parts, systems, ... } @ inputs:
        flake-parts.lib.mkFlake { inherit inputs; } {
            inherit (import systems) systems;
            imports = [ ./modules ];
        };
}
