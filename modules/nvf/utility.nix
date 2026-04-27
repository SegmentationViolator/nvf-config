_: {
    flake.nvfModules.default = _: {
        config.vim = {
            presence.neocord.enable = true;
            ui.fastaction.enable = true;

            terminal.toggleterm = {
                enable = true;
                setupOpts = {
                    direction = "float";
                    size = 10;
                };
            };

            utility = {
                direnv.enable = true;
                multicursors.enable = true;
            };
        };
    };
}
