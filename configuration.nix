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

        binds.whichKey = {
            enable = true;
            setupOpts.preset = "helix";
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

        extraPackages = with pkgs; [
            imagemagick
        ];

        filetree.nvimTree = {
            enable = true;
            mappings.toggle = " tt";

            setupOpts = {
                actions.open_file.resize_window = true;
                diagnostics.enable = true;
                disable_netrw = true;
                git.enable = true;
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

            json = {
                enable = true;
                lsp.enable = false;
            };

            kotlin.enable = true;

            markdown = {
                enable = true;
                extensions.markview-nvim.enable = true;
                lsp.enable = false;
            };

            nix = {
                enable = true;
                lsp.servers = [ "nixd" ];
            };

            python = {
                enable = true;
                format.type = [ "isort" "ruff" ];
            };

            rust = {
                enable = true;
                extensions.crates-nvim.enable = true;
            };

            tailwind.enable = true;

            ts.enable = true;

            typst = {
                enable = true;
                extensions.typst-preview-nvim.enable = true;
            };

            wgsl = {
                enable = true;
                lsp.enable = false;
            };

            yaml = {
                enable = true;
                lsp.enable = false;
            };
        };

        lazy.plugins = {
            "blink.pairs" = {
                package = pkgs.vimPlugins.blink-pairs;
                setupModule = "blink.pairs";
            };
        };

        lineNumberMode = "number";

        lsp = {
            enable = true;
            inlayHints.enable = true;
            lightbulb.enable = true;
            lspkind.enable = true;
        };

        luaPackages = [
            "magick"
        ];

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

        statusline.lualine.enable = true;

        tabline.nvimBufferline = {
            enable = true;
            setupOpts.options.numbers = "none";
        };

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

            images.image-nvim = {
                enable = true;
                setupOpts = {
                    backend = "kitty";
                    processor = "magick_rock";
                };
            };

            multicursors.enable = true;
        };

        visuals = {
            fidget-nvim.enable = true;
            indent-blankline.enable = true;
            nvim-web-devicons.enable = true;
        };
    };
}
