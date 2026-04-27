_: {
    flake.nvfModules.default = _: {
        config.vim = {
            clipboard = {
                enable = true;
                providers.wl-copy.enable = true;
            };

            comments.comment-nvim.enable = true;
            utility.multicursors.enable = true;
        };
    };
}
