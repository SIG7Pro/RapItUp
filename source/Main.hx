import haxe.CallStack;
import openfl.events.UncaughtErrorEvent;
import openfl.Lib;
import openfl.display.FPS;
import flixel.FlxG;
import flixel.FlxGame;

class Main extends FlxGame {
	function new() {
		#if (hl && !debug)
		hl.UI.closeConsole();
		#end

		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onFatalUncaughtException);

		super(TitleState);
		FlxG.stage.addChild(new FPS(10, 3, 0xffffffff));
	}

	static function onFatalUncaughtException(e:UncaughtErrorEvent) {
		var error = e.error;

		var exception = CallStack.toString(CallStack.exceptionStack(true));
		error += '\n\n$exception';
	
		FlxG.stage.window.alert(error, 'Fatal Uncaught Exception!');
		Sys.exit(1);
	}
}