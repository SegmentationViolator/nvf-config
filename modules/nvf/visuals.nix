_: {
    flake.modules.nvf.default = { pkgs, ... }: {
        config.vim = {
            extraPackages = with pkgs; [
                imagemagick
            ];

            luaPackages = [
                "magick"
            ];

            statusline.lualine.enable = true;

            theme = {
                enable = true;
                name = "tokyonight";
                style = "night";
            };

            ui = {
                colorful-menu-nvim.enable = true;

                colorizer = {
                    enable = true;
                    setupOpts.filetypes."*" = {
                        RGB = true;
                        RRGGBB = true;
                        RRGGBBAA = true;
                    };
                };
            };

            utility.images.image-nvim = {
                enable = true;
                setupOpts = {
                    backend = "kitty";
                    processor = "magick_rock";
                };
            };

            visuals = {
                fidget-nvim.enable = true;
                indent-blankline.enable = true;
                nvim-web-devicons.enable = true;
            };
        };
    };
}
