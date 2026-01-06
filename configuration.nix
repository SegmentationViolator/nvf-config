{ pkgs, ... }:

{
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

                sources.default = [
                    "lsp"
                    "path"
                    "buffer"
                ];
            };
        };

        binds.whichKey.enable = true;

        comments.comment-nvim.enable = true;

        diagnostics = {
            enable = true;
            config = {
                signs = true;
                virtual_text = true;
            };
        };

        extraLuaFiles = [
            ./lua/save-as-root.lua
        ];

        extraPlugins = with pkgs.vimPlugins; {
            blink-pairs = {
                package = blink-pairs;
                setup = ''require("blink.pairs").setup({})'';
            };
        };

        filetree.nvimTree = {
            enable = true;
            setupOpts = {
                diagnostics.enable = true;
                disable_netrw = true;
                hijack_cursor = true;
            };
        };

        languages = {
            enableExtraDiagnostics = true;
            enableFormat = true;
            enableTreesitter = true;

            assembly.enable = true;
            clang.enable = true;
            css.enable = true;
            html.enable = true;
            java.enable = true;
            markdown.enable = true;
            nix.enable = true;
            python.enable = true;

            rust = {
                enable = true;
                extensions.crates-nvim.enable = true;
            };

            tailwind.enable = true;
            ts.enable = true;
            typst.enable = true;
        };

        lineNumberMode = "number";

        lsp = {
            enable = true;
            inlayHints.enable = true;
        };

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

        presence.neocord.enable = true;

        statusline.lualine.enable = true;

        tabline.nvimBufferline.enable = true;

        telescope = {
            enable = true;
            extensions = [
                {
                    name = "fzf";
                    packages = [ pkgs.vimPlugins.telescope-fzf-native-nvim ];
                    setup = {
                        fzf = {
                            fuzzy = true;
                        };
                    };
                }
            ];
        };

        terminal.toggleterm = {
            setupOpts = {
                direction = "float";
                size = 10;
            };
        };

        theme = {
            enable = true;
            name = "tokyonight";
            style = "night";
        };

        ui.colorizer = {
            enable = true;
            setupOpts.filetypes."*" = {
                RGB = true;
                RRGGBB = true;
                RRGGBBAA = true;
            };
        };

        visuals = {
            fidget-nvim.enable = true;
            indent-blankline.enable = true;
            nvim-web-devicons.enable = true;
        };
    };
}
