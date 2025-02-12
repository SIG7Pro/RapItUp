Rap-It-Up / Indev.
Still in progress.

Inspired by games like Friday Night Funkin', Parappa The Rapper, and Dance Dance Revolution.

Feel free to contribute!
______________________

Hotkeys:
WASD - Spawn notes.
Arrow Keys - Hit notes. (Both go to the right side of the screen.)

Esc/Backsapce - Head to Title/Menu

`/~ - Enable HaxeFlixel debugger. (When compiled for debug.)

______________________

How to Build:
-- These instructions aren't meant for playing normally, as there's hardly any game in here yet. --

To build the game, you need to have Haxe installed on a computer.
Alongside Haxe, you'll need some libraries (haxelibs), the libs needed are HaxeFlixel, Lime, and OpenFL (HX). Lime and OFL should be installed when installing HaxeFlixel, so don't fret.

To compile, make sure you have lime and flixel setup, if you've gone over the HaxeFlixel installation on the website, it should be set up. Most people do "lime test html" or something like that. This project is no exception.

When compiling, try doing:

lime test hl/OS -debug
(replace OS with ur operating system)

Doing "lime test hl" compiles it for Hashlink, which is basically a Haxe "virtual machine." In a nutshell, it compiles a lot faster than building for standard computer code, which should take maybe fifteen minutes (roughly) depending on your machine.

Doing "lime test html" or "lime test html5" compiles it for web.
Rap-It-Up hasn't been tested to see if it works on web however. This also applies for other targets, which will be listed later.
______________________


Compile Flags
These are terms put into the command line when compiling that alter (minor) things.

R-I-U Flags:
-Dncw / Disables the watermark given when compiling.
-DebText / Enables minor debug/info texts. Requires debug mode.

Default Flags:
-debug / Enables debug mode.
-release / Enables release mode, compiles a new build as if you were about to release it.
-clean / Recompiles a 'clean' build, any modified files in the export folder will need to be backed up.

______________________

--- Supported Targets ---

Windows:
- Windows 10 (Supposedly.)

Linux:
- Zorin OS 17.1
- Bodhi Linux
- KDE Neon 22.04

In theory, this should work flawlessly on Ubuntu and Debian, since all of these happen to derive from it.

Other:
TBD

-- Unsupported/Untested Targets --

These targets cover targets or operating system types which haven't been confirmed to work or been tested on, such as BSD, Neko (an older Haxe VM), JavaScript, iOS, Android, Blackberry, and Mac. These haven't been tested as development has been handled on Windows and Linux (primarily the latter.)

However, these targets may recieve compatibility in the future. But for now, these aren't the main focus.





To every company that has VTuber stuff and has the player require permission from the developers and whatnot (apparently that exists), you have full perms.
Make sure the game is at least seen 50% of the screen and not anime tits!
