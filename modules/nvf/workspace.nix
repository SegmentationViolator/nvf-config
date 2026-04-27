_: {
    flake.modules.nvf.default = _: {
        config.vim = {
            diagnostics = {
                enable = true;
                config = {
                    signs = true;
                    virtual_text = true;
                };
            };

            lsp = {
                enable = true;
                inlayHints.enable = true;
                lightbulb.enable = true;
                lspkind.enable = true;
            };
        };
    };
}
