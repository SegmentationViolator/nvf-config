_: {
    flake.nvfModules.default = _: {
        config.vim = {
            options = {
                background = "dark";
                cursorline = true;
                expandtab = true;
                number = true;
                shiftwidth = 4;
                showmode = false;
                tabstop = 4;
                wrap = false;
            };

            lineNumberMode = "number";
        };
    };
}
