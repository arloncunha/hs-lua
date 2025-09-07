--[[
hello.lua - Hammerspoon Hello World Example

Description:
    A simple demonstration script that shows basic Hammerspoon functionality.
    Displays current working directory, command line arguments, and shows
    a visual alert to confirm the Hammerspoon runtime is working properly.

Usage:
    hs-lua hello.lua [args...]

Author: hs-lua project
Date: 2025
--]]

-- Display current working directory for debugging purposes
print("cwd:", hs.fs.currentDir())

-- Show all command line arguments passed to the script
print("args:", table.concat(arg, ", "))

-- Display a visual alert to confirm Hammerspoon is running
hs.alert.show("Hello from HS Lua runtime!")
