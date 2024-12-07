import openfl.Assets;
import openfl.display.Sprite;

import ui.Performance;
import haxe.CallStack;
import openfl.events.UncaughtErrorEvent;
import openfl.Lib;
import flixel.FlxGame;
import flixel.FlxG;

import lime.system.System;
import sys.FileSystem;

#if FLX_FOCUS_LOST_SCREEN
import flixel.system.ui.FlxFocusLostScreen;
import ui.FocusLost;
#end

import ui.menus.TitleState;

class Main extends Sprite {
	public static var performance:Performance;
	public static var OSVers:String = ("Unknown");

	public function new() {

		super();
		systemIcon();

		#if (hl && !debug)
		hl.UI.closeConsole();
		#end

		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onUncaughtError);
	
		var font = Assets.getFont(Paths.font('Orbitron/Orbitron Medium'));

		#if debug
			var bmSuffix:String = "-fancy-2";
		#else
			var bmSuffix:String = "";
		#end

		var bitmap = Assets.getBitmapData(Paths.image('UI/Salem50x50' + bmSuffix));

		performance = new Performance(font, bitmap, true, true);



		//super(ui.menus.TitleState);
		addChild(new FlxGame(0, 0, TitleState));
		FlxG.stage.addChild(performance);

		@:privateAccess
		var _customFocusLostScreen = ui.FocusLost;
	}

	function onUncaughtError(e:UncaughtErrorEvent) {
		var error = e.error;

		var exceptionStack = CallStack.toString(CallStack.exceptionStack(true));
		error += '\n\n$exceptionStack';

		FlxG.stage.window.alert(error, 'Uncaught Error');
		Sys.exit(1);
	}

	function systemIcon(){

		#if linux
		flixel.FlxG.stage.window.setIcon(lime.graphics.Image.fromFile("assets/images/Icons/App/Aero.png"));
		#end

		#if windows
		// Detects for Windows 7 or R8P. Only Windows 7 at the moment.
		if (LimeSys.platformVersion == 7)){
			flixel.FlxG.stage.window.setIcon(lime.graphics.Image.fromFile("assets/images/Icons/App/Aero.png"));
		}
		#end

	}
}
