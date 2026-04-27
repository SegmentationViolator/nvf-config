_: {
    flake.modules.nvf.default = _: {
        config.vim = {
            autocomplete.blink-cmp = {
                enable = true;
                setupOpts = {
                    cmdline.keymap.preset = "super-tab";

                    keymap."<C-k>" = [
                        "show_signature"
                        "hide_signature"
                        "fallback"
                    ];

                    signature.enabled = true;
                };
            };

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
