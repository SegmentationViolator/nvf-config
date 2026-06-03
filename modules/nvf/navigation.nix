_: {
    flake.modules.nvf.default = { pkgs, ... }: {
        config.vim = {
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
                            fzf.fuzzy = true;
                        };
                    }
                ];
            };
        };
    };
}
