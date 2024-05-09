# Compiling The Game
## Note
This is just a moved version of an altered large chunk of the readme over to its own special file.

![Salem Icon (50x50 Size)](/assets/images/UI/Salem50x50.png)

## Requirements:

### Software
[Haxe](https://haxe.org) is what's mainly needed for this, everything else required should be easily found below.

### Libraries

If you have Haxe installed, then continue on. The haxelibs you require are Lime, OpenFL, HaxeFlixel, and Flixel-Addons. The HaxeFlixel install page covers this part, so run all the commands here: https://haxeflixel.com/documentation/install-haxeflixel/, and then run

```batch
haxelib install flixel-addons
```
If you don't have Flixel-Addons already installed.

### Compiling
Now, when everything is done, you can simply run:
`lime test PLATFORM` or `lime build PLATFORM` to build the game. Replace platform with the platform of choice, such as `windows`, `mac`/`macos`, `linux`, `html`/`html5`, `flash`, etc.
- Running it with the `test` command builds and does other helpful background things then launches the app, doing just `build` only builds the game, but doesn't launch it.
- For debugging, you can run [`lime test hl -debug`](use%20hashlink%20for%20debug.txt), which compiles to Hashlink. In a nutshell, its a "virtual machine" for Haxe, which is used as an alternative to compiling to C++ code. More info here: https://hashlink.haxe.org/
     - For macOS users specifically, you'll need to run `lime setup hashlink` to get access to the HL debugger. (Source: https://lime.openfl.org/docs/advanced-setup/hashlink/)
- If you're on a desktop environment, then you can only compile for your own target, as well as HTML5. This means you **cannot** compile for other operating systems. Like compiling to Mac from Linux, or Windows on Mac just **won't** work! This is a limiation on Lime and OpenFL, and not the game itself.

If you want to relaunch the game, then you can either type: `lime run PLATFORM`, or you can go to `export/PLATFORM/bin` and you should see the executable there.

### Troubleshooting
If you get errors, [submit an issue](https://github.com/SIG7Pro/RapItUp/issues) on the GitHub repo.

### Extra Info
If you need any more help, try visiting the [Haxe Discord](https://discordapp.com/invite/rqEBAgF) server.

![Compiling The Game](assets/Compiling.png)