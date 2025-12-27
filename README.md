# nvf-config

My Neovim config

## Usage

This flake exposes a x86_64-linux package named `default`, which wraps [`neovim`](https://github.com/NixOS/nixpkgs/tree/nixos-unstable/pkgs/applications/editors/neovim)

### Example configuration:

add the following to your flake inputs,

```nix
    nvf-config = {
        url = "github:SegmentationViolator/nvf-config";
        inputs.nixpkgs.follows = "nixpkgs";
    };
```

add the following to your systemPackages (or wherever you wish),

```nix
    nvf-config.packages.x86_64-linux.neovim
```
