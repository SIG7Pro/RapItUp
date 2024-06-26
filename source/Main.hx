import openfl.Assets;
import ui.Performance;
import haxe.CallStack;
import openfl.events.UncaughtErrorEvent;
import openfl.Lib;
import flixel.FlxGame;
import flixel.FlxG;

class Main extends FlxGame {
	public static var performance:Performance;

	public function new() {
		#if (hl && !debug)
		hl.UI.closeConsole();
		#end

		#if linux
		flixel.FlxG.stage.window.setIcon(lime.graphics.Image.fromFile("assets/images/Icons/App/Aero.png"));
		// Would it be worth it to make a thing that detects different operating system versions/variants and switch accordingly?
		// Hmm...
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