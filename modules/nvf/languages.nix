_: {
    flake.modules.nvf.default = _: {
        config.vim = {
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

                typescript.enable = true;

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
        };
    };
}
