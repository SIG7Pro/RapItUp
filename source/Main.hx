import haxe.CallStack;
import openfl.events.UncaughtErrorEvent;
import openfl.Assets;
import openfl.Lib;
import openfl.display.FPS;
import openfl.text.TextFormat;
import flixel.FlxG;
import flixel.FlxGame;

import Performance; // https://github.com/yupswing/plik/blob/master/com/akifox/plik/debug/Performance.hx
// https://community.openfl.org/t/class-display-fps-stats-memory-usage-and-more/802
class Main extends FlxGame {

var fontDir:String = 'assets/fonts/';
var infoFont:String = 'captura-now-regular.otf';
		/*#if windows
		     infoFont == "monsterrat.ttf";
		#elseif linux
		     infoFont == "Ubuntu-M.ttf";
		#elseif mac
		     infoFont == "captura-now-regular.otf";
		#end*/

	function new() {
		#if (hl && !debug)
		hl.UI.closeConsole();
		#end
		

		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onFatalUncaughtException);
		
		var performance = new Performance(Assets.getFont(fontDir + infoFont),       //any font you want
                                      Assets.getBitmapData("assets/images/UI/Salem50x50.png"), //null or any BitmapData (suggested 50x50pixels) // I made the Salem pic in what felt like 5 minutes.
                                      true,  // true if you want to see the APP information
                                      false); // true if you want to see the FPS Graph


		super(TitleState);
		FlxG.stage.addChild(new FPS(10, 3, 0xffffffff));
		FlxG.stage.addChild(performance);
	}

	static function onFatalUncaughtException(e:UncaughtErrorEvent) {
		var error = e.error;

		var exception = CallStack.toString(CallStack.exceptionStack(true));
		error += '\n\n$exception';
	
		FlxG.stage.window.alert(error, 'Fatal Uncaught Exception!\nOh No!');
		Sys.exit(1);
	}
}
