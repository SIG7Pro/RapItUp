# Compiling The Game
## Note
This is just a moved version of an altered large chunk of the readme over to its own special file.

![Salem Icon (50x50 Size)](/assets/images/UI/Salem50x50.png)

## Requirements:

### Software
* [Haxe](https://haxe.org) (Tested with 4.3.4, may not work with older versions.)
* [HaxeFlixel](https://haxeflixel.com/documentation/install-haxeflixel/) 
    * (HaxeFlixel, and the items below are libraries that can be installed from the terminal.)
* [Flixel-Addons](https://github.com/HaxeFlixel/flixel-addons)
* [Lime](https://lime.openfl.org/)
* [OpenFL (Haxe)](https://www.openfl.org/)

Should be simple to install and setup. Try referring to [Getting Started | HaxeFlixel - 2D Game Engine](https://haxeflixel.com/documentation/getting-started/) for help.

I'll write a better install and compile list when this is in a more favorable state.

### Libraries

If you have Haxe installed, then I'd recommend you put these commands into the terminal to install the correct libraries that this requires to run. However, if you went through the HaxeFlixel install page, then its likely you can skip this step, as you likely have most of these.

```batch
haxelib install lime
haxelib install openfl
haxelib install flixel
haxelib run lime setup flixel
haxelib run lime setup
haxelib install flixel-addons
```
If you get errors compiling on macOS, then try running the commands under `bash`.

### Compiling
Now, when everything is done, you can simply run:
`lime test PLATFORM` or `lime build PLATFORM` to build the game. Replace platform with the platform of choice, such as `windows`, `mac`/`macos`, `linux`, `html`/`html5`, `flash`, etc.
- Running it with the `test` command builds and does other helpful background things then launches the app, doing just `build` only builds the game, but doesn't launch it.
- If you're on a desktop environment, then you can only compile for your own target, as well as HTML5, and granted you have certain tools, other misc targets, such as Android (with Android Studio), or to consoles (such as the Nintendo Switch family of systems.) This means you **cannot** compile other desktop builds. Like compiling to Mac from Linux, or Windows on Mac just **won't** work! This is a limiation on Lime and OpenFL, and not the game itself.

According to the [About](https://haxeflixel.com/documentation/about/) page on the HaxeFlixel website, you can also compile to Neko, Blackberry, iOS, Android, and WebOS (mobile); however, these are untested and require more work. [For debugging, you can run](use%20hashlink%20for%20debug.txt) `lime test hl -debug` [which is beneficial for development.](use%20hashlink%20for%20debug.txt)

### Troubleshooting
If you get errors, such as:
`source/Main.hx:7: characters 8-15 : Type not found :` (for **example**), then you likely either have the wrong versions of some Haxelibs or Haxe itself, or its what's known as a [PEBKAC](https://en.wikipedia.org/wiki/User_error) (Problem Exists Between Keyboard And Chair) or simply a User Error. If you encounter any errors, [submit an issue](https://github.com/SIG7Pro/RapItUp/issues) on the GitHub repo. (This requires a GitHub account.)

### Extra Info
If you need any more help, try visiting the [Haxe Discord](https://discordapp.com/invite/rqEBAgF) server.

![Compiling The Game](assets/Compiling.png)