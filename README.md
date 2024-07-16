 ![](https://cdn.luogu.com.cn/upload/image_hosting/qgclyez5.png)

## Summary

This is a plugin implemented in **Vimscript** language that can run in Vim.

This plugin enables one click annotation of **C++** code in normal mode, insertion mode, selection mode, and visual mode.

At present, C, C++ and pascal is supported, and one click comments for languages such as Python, Java, and Go will be updated in the future.

The current version number is 1.1.

If there is a problem, please contact me, or submit an issue or a pull requiest.

I dislike neovim,so this is a vim plugin.

## Usage

In `cpp` or `pascal` files, one or more lines of code can be commented out, limited to `//`.

Due to the short length of the plugin code, you can directly copy the code in your `Vimrc` file, or download it and open the plugin through the `source` statement.

The plugin may not be suitable for your configuration. You can modify your shortcut key at the end of the plugin code. The current shortcut key is:

- In insert mode annotation on one line: "\`\/".
- In normal mode annotation on one line: "gf".
- In visual mode annotation in two or more line: "K".
- In select mode annotation in two or more line: "\`\/".

You can change these configurations to make it more convenient for you to use Vim.
