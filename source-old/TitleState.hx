package;

//import sys.io.Process;
import flash.system.System;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
//import Sys; // Note: Sys.hx in here is the same as the one included with Haxe, except I didn't know the import so I included it with the source. // Didn't work.
// Slightly modified from the HaxeFlixel Dungeon Crawler example project. Temporarily, of course.
class TitleState extends FlxState
{
	var titleText:FlxText;
	var playButton:FlxButton;
	var optionsButton:FlxButton;
	#if desktop
	var exitButton:FlxButton;
	#end

	override public function create()
	{
	// Terminal tracing. (Experimental. https://api.haxe.org/Sys.html#command)
	//command(whoami);
	
	// Actual spawning.
		titleText = new FlxText(20, 0, 0, "Rap It Up\nPrototype\n(Placeholder Name)", 22);
		titleText.alignment = CENTER;
		titleText.screenCenter(X);
		add(titleText);

		playButton = new FlxButton(0, 0, "Play", clickPlay);
		//playButton.onUp.sound = FlxG.sound.load(AssetPaths.select__wav);
		playButton.x = (FlxG.width / 2) - 10 - playButton.width;
		playButton.y = FlxG.height - playButton.height - 10;
		add(playButton);

		/*optionsButton = new FlxButton(0, 0, "Options", clickOptions);
		optionsButton.x = (FlxG.width / 2) + 10;
		optionsButton.y = FlxG.height - optionsButton.height - 10;
		add(optionsButton);*/

		#if desktop
		exitButton = new FlxButton(FlxG.width - 28, 8, "X", clickExit);
		//exitButton.loadGraphic(AssetPaths.button__png, true, 20, 20);
		add(exitButton);
		#end

		/*if (FlxG.sound.music == null) // don't restart the music if it's already playing
		{
			#if flash
			FlxG.sound.playMusic(AssetPaths.HaxeFlixel_Tutorial_Game__mp3, 1, true);
			#else
			FlxG.sound.playMusic(AssetPaths.HaxeFlixel_Tutorial_Game__ogg, 1, true);
			#end
		}*/

		FlxG.camera.fade(FlxColor.BLACK, 0.33, true);

		super.create();
	}

	function clickPlay()
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
		{
			FlxG.switchState(PlayState.new);
		});
	}

	function clickOptions()
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
		{
			//FlxG.switchState(OptionsState.new);
		});
	}

	#if desktop
	function clickExit()
	{
		Sys.exit(0);
	}
	#end
}
