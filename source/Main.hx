import openfl.display.FPS;
import flixel.FlxG;
import flixel.FlxGame;

class Main extends FlxGame {
	function new() {
		super(TitleState);
		FlxG.stage.addChild(new FPS(10, 3, 0xffffffff));
	}
}