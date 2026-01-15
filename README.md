# Usage

This flake exposes a package named `default`, which wraps neovim

## Example configuration:

add the following to your flake inputs,

```nix
    nvf-config = {
        url = "github:SegmentationViolator/nvf-config";
        inputs.nixpkgs.follows = "nixpkgs";
    };
```

add the following to your systemPackages (for a system-wide installation),

```nix
    nvf-config.packages.${pkgs.stdenv.hostPlatform.system}.neovim
```
