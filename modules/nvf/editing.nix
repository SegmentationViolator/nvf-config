_: {
    flake.modules.nvf.default = { pkgs, ... }: {
        config.vim = {
            clipboard = {
                enable = true;
                providers.wl-copy.enable = true;
            };

            comments.comment-nvim.enable = true;

            lazy.plugins = {
                "autolist" = {
                    package = pkgs.vimPlugins.autolist-nvim;
                    setupModule = "autolist";
                    ft = "markdown";
                };

                "blink.pairs" = {
                    package = pkgs.vimPlugins.blink-pairs;
                    setupModule = "blink.pairs";
                };
            };

            utility.multicursors.enable = true;
        };
    };
}
