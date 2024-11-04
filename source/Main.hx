import openfl.Assets;
import ui.Performance;
import haxe.CallStack;
import openfl.events.UncaughtErrorEvent;
import openfl.Lib;
import flixel.FlxGame;
import flixel.FlxG;

import lime.system.System;
import sys.FileSystem;

class Main extends FlxGame {
	public static var performance:Performance;
	public static var OSVers:String = ("Unknown");

	public function new() {
		#if linux
		flixel.FlxG.stage.window.setIcon(lime.graphics.Image.fromFile("assets/images/Icons/App/Aero.png"));
		#end

		#if (hl && !debug)
		hl.UI.closeConsole();
		#end

		/*// OS Detection. Serves no ingame puropse yet. Minor adjustments made..
		// Todo: Get this to show up ingame.
		OSVers == lime.system.System.platformName + " " + lime.system.System.platformVersion;
		#if linux
		if ( FileSystem.exists('/usr/share/bodhi/quickstart/images/cc.png') ){ //Checks for Bodhi Linux. Might get other versions for other Linux Distros *if needed*. If the System name and version say something different than the OS name itself (how Bodhi says Ubuntu since its a deriative but they forgot to update it) then it can go here.
			OSVers == "Bodhi Linux on"+ lime.system.System.platformName + " " + lime.system.System.platformVersion + "."; // Reason this is here instead of the old if/elses is since it'd just overwrite if on Bodhi and do nothing if otherwise. Much better. {Writing this on KDE Neon right now since I bricked my Bodhi install.}
		}
		#end

		trace('You are running: ' + OSVers);*/


		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onUncaughtError);
	
		var font = Assets.getFont(Paths.font('captura-now-regular'));
		var bitmap = Assets.getBitmapData(Paths.image('UI/Salem50x50'));

		performance = new Performance(font, bitmap, true, true);

		super(ui.menus.TitleState);
		FlxG.stage.addChild(performance);
	}

	function onUncaughtError(e:UncaughtErrorEvent) {
		var error = e.error;

		var exceptionStack = CallStack.toString(CallStack.exceptionStack(true));
		error += '\n\n$exceptionStack';

		FlxG.stage.window.alert(error, 'Uncaught Error');
		Sys.exit(1);
	}
}
