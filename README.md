<div align="center">
  <img src="hs-lua.png" alt="hs-lua logo" width="200">
</div>

# HS Lua

**hs-lua** is a command-line wrapper that lets you run Lua code and files using the Hammerspoon runtime.

## Run Lua Scripts with Hammerspoon Runtime in 2 Minutes

**hs-lua** bridges the gap between command-line Lua scripting and macOS automation. Instead of installing a separate Lua interpreter, it leverages Hammerspoon's runtime to give you instant access to powerful system APIs from the terminal. Perfect for quick automation tasks, prototyping, or adding macOS integration to your Lua scripts.

## What it is and when to use it

hs-lua provides a `lua`-like command-line interface that executes Lua code within the Hammerspoon environment. This gives you access to Hammerspoon's extensive macOS automation APIs while maintaining familiar Lua scripting patterns.

**Use hs-lua when you want to:**
- Run Lua scripts without installing a separate Lua interpreter
- Access Hammerspoon's macOS system integration APIs from command line
- Prototype Hammerspoon automation scripts interactively

## Get started (≤ 2 minutes)

**Prerequisites**
- macOS with [Hammerspoon](https://www.hammerspoon.org/) installed
- Hammerspoon must be running (appears in menu bar)

**Install**
```bash
# Make the script executable
chmod +x hs_lua

# Optional: Add to PATH for system-wide access
sudo cp hs_lua /usr/local/bin/

# Optional: Create alias for 'lua' command
echo 'alias lua="hs_lua"' >> ~/.zshrc && source ~/.zshrc
# For bash users: echo 'alias lua="hs_lua"' >> ~/.bashrc && source ~/.bashrc
```

**First use**
```bash
# Test with inline code
./hs_lua -e 'print("Hello from Hammerspoon!")'
# Expected output: Hello from Hammerspoon!

# Test with a script file
./hs_lua hello.lua
# Expected output: 
# cwd: /path/to/current/directory
# args: 
# [Hammerspoon alert popup appears]
```

**Verify**
```bash
./hs_lua -v
# Expected output shows Hammerspoon and Lua versions
```

## Task recipes

### Run interactive Lua REPL
**Goal:** Start an interactive Lua session with Hammerspoon APIs

1. Run without arguments: `./hs_lua`
2. Try Hammerspoon-specific commands: `hs.alert.show("Test")`
3. Exit with `os.exit()` or Ctrl+C

**Verify:** Alert popup appears on screen

### Execute inline Lua code with arguments
**Goal:** Run a one-liner Lua script with command-line arguments

1. Use `-e` flag: `./hs_lua -e 'print("Args:", table.concat(arg, ", "))' -- foo bar baz`
2. Arguments after `--` become available in the `arg` table

**Verify:** Output shows `Args: foo, bar, baz`

### Run Lua script files
**Goal:** Execute a `.lua` file with arguments

1. Create a script: `echo 'print("Script args:", table.concat(arg, ", "))' > test.lua`
2. Run with arguments: `./hs_lua test.lua hello world`

**Verify:** Output shows `Script args: hello, world`

### Access Hammerspoon APIs from scripts
**Goal:** Use macOS system features from Lua scripts

1. Create automation script:
```lua
-- notify.lua
hs.notify.new({title="hs-lua", informativeText="Script completed!"}):send()
print("Notification sent")
```
2. Run: `./hs_lua notify.lua`

**Verify:** macOS notification appears

## Real example

```lua
-- system_info.lua - Display system information
print("=== System Information ===")
print("Hammerspoon version:", hs.processInfo.version)
print("Lua version:", _VERSION)
print("Current directory:", hs.fs.currentDir())
print("Battery level:", hs.battery.percentage() .. "%")
print("WiFi network:", hs.wifi.currentNetwork() or "Not connected")

-- Show notification
hs.notify.new({
    title = "System Check",
    informativeText = "Battery: " .. hs.battery.percentage() .. "%"
}):send()
```

Run with: `./hs_lua system_info.lua`

## Command reference

| Command | Description | Example |
|---------|-------------|---------|
| `hs_lua` | Start interactive REPL | `./hs_lua` |
| `hs_lua -e 'code'` | Execute inline code | `./hs_lua -e 'print("hi")'` |
| `hs_lua script.lua` | Run script file | `./hs_lua myscript.lua` |
| `hs_lua -h` | Show help message | `./hs_lua --help` |
| `hs_lua -v` | Show version info | `./hs_lua --version` |

**Argument passing:**
- For `-e`: Use `--` separator: `hs_lua -e 'code' -- arg1 arg2`
- For scripts: Direct arguments: `hs_lua script.lua arg1 arg2`
- Arguments available in `arg` global table

## Why use hs-lua instead of regular Lua?

| Feature | Regular Lua | hs-lua |
|---------|-------------|---------|
| Installation | Requires separate Lua install | Uses existing Hammerspoon |
| macOS Integration | Limited/requires C modules | Full Hammerspoon API access |
| System Automation | Complex setup needed | Built-in automation APIs |
| Notifications | Third-party libraries | `hs.notify` built-in |
| File System | Basic `io` module | Enhanced `hs.fs` module |
| JSON Support | External library needed | `hs.json` included |

## Troubleshooting

| Error | Cause | Fix | Verify |
|-------|-------|-----|--------|
| `Error: Hammerspoon not found` | Hammerspoon not installed | Install from hammerspoon.org, run once | `hs -c 'print("ok")'` |
| `Error: Hammerspoon not responding` | Hammerspoon not running | Start Hammerspoon app | Check menu bar for icon |
| `hs_lua: permission denied` | Script not executable | `chmod +x hs_lua` | `ls -l hs_lua` shows `x` |
| `missing code after -e` | No code provided after `-e` | Add code string: `-e 'print("hi")'` | Command executes |

## Compatibility and versions

- **macOS:** 10.12+ (matches Hammerspoon requirements)
- **Hammerspoon:** Any recent version (tested with 0.9.90+)
- **Shell:** bash, zsh, fish compatible
- **Lua version:** Matches Hammerspoon's embedded Lua (typically 5.4)

## See also

- [Hammerspoon API Documentation](https://www.hammerspoon.org/docs/)
- [Hammerspoon Getting Started Guide](https://www.hammerspoon.org/go/)
- [Lua 5.4 Reference Manual](https://www.lua.org/manual/5.4/)
- [Hammerspoon Configuration Examples](https://github.com/Hammerspoon/hammerspoon/wiki/Sample-Configurations)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.