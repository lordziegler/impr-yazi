-- init.lua — plugin bootstrap for Yazi
-- Part of Imperator-dotfiles · https://github.com/lordziegler/Imperator-dotfiles
-- Run `ya pkg install` after symlinking to restore all plugins from package.toml.

-- Git status icons in the file listing
require("git"):setup()
