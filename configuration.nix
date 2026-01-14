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
            };
        };

        clipboard = {
            enable = true;
            providers.wl-copy.enable = true;
        };

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

        languages = {
            enableExtraDiagnostics = true;
            enableFormat = true;
            enableTreesitter = true;

            assembly = {
                enable = true;
                lsp.enable = true;
            };

            clang = {
                enable = true;
                lsp.enable = true;
            };

            css = {
                enable = true;
                lsp.enable = true;
            };

            html = {
                enable = true;
                lsp.enable = true;
            };

            json.enable = true;

            markdown = {
                enable = true;
                extensions.markview-nvim.enable = true;
            };

            nix = {
                enable = true;
                lsp = {
                    enable = true;
                    servers = [ "nixd" ];
                };
            };

            python = {
                enable = true;
                format.type = [ "isort" "ruff" ];
                lsp.enable = true;
            };

            rust = {
                enable = true;
                extensions.crates-nvim.enable = true;
                lsp.enable = true;
            };

            tailwind = {
                enable = true;
                lsp.enable = true;
            };

            ts = {
                enable = true;
                lsp.enable = true;
            };

            typst = {
                enable = true;
                extensions.typst-preview-nvim.enable = true;
                lsp.enable = true;
            };

            wgsl.enable = true;

            yaml.enable = true;
        };

        lazy.plugins = {
            "blink.pairs" = {
                package = pkgs.vimPlugins.blink-pairs;
            };
        };

        lineNumberMode = "number";

        lsp = {
            inlayHints.enable = true;
            lightbulb.enable = true;
            lspkind.enable = true;
            lspSignature.enable = true;
        };

        options = {
            background = "dark";
            cursorline = true;
            expandtab = true;
            number = true;
            shiftwidth = 4;
            showmode = false;
            tabstop = 4;
            wrap = true;
        };

        statusline.lualine.enable = true;

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
            enable = true;
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

            fastaction.enable = true;
        };

        utility = {
            direnv.enable = true;
            multicursors.enable = true;
        };

        visuals = {
            fidget-nvim.enable = true;
            indent-blankline.enable = true;
            nvim-web-devicons.enable = true;
        };
    };
}
