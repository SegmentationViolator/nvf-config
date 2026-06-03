_: {
    flake.nvfModules.default = _: {
        config.vim = {
            binds.whichKey = {
                enable = true;
                setupOpts.preset = "helix";
            };

            extraLuaFiles = [
                ./lua/save-as-root.lua
            ];
        };
    };
}
