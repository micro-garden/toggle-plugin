# Toggle Options Plugin

This plugin adds two commands to micro for toggling boolean configuration
options.

It is especially useful when bound to keyboard shortcuts, allowing quick
enable/disable of features like `wordwrap`, `hlsearch`, or `linter`.

## Commands

### `toggle <option>`

Toggles a global boolean option.

Example:

```
toggle hlsearch
```

### `togglelocal <option>`

Toggles a buffer-local boolean option.

Example:

```
togglelocal wordwrap
```

If the option is not boolean or doesn't exist, an error will be shown.

## Example Keybindings

To make the most of this plugin, bind toggle commands to shortcuts in your
`bindings.json`:

```json
{
    "Alt-w": "command:togglelocal wordwrap",
    "Alt-l": "command:togglelocal linter",
    "Alt-h": "command:toggle hlsearch"
}
```
