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
		#if (hl && !debug)
		hl.UI.closeConsole();
		#end

		#if linux
		flixel.FlxG.stage.window.setIcon(lime.graphics.Image.fromFile("assets/images/Icons/App/Aero.png"));
		#end

		#if linux
		trace('You are running');

		if ( FileSystem.exists('/usr/share/bodhi/quickstart/images/cc.png') ){
			trace("Bodhi Linux");
			OSVers == "Bodhi Linux";
		}else{
			trace(lime.system.System.platformName);
			trace(lime.system.System.platformVersion);
			OSVers == lime.system.System.platformName + " " + lime.system.System.platformVersion;
		}
		#end

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