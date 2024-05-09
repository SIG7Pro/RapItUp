import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxState;

class TitleState extends FlxState {
	override function create() {
		var titleText = new FlxText(20, 0, 0, 'Rap-It-Up\nPrototype\n \n \n \n \nWork In Progress.');
		titleText.setFormat("assets/fonts/vcr.ttf", 22, CENTER);
		titleText.screenCenter(X);
		add(titleText);

		var playButton = new FlxButton('Play', click.bind('play'));
		playButton.setPosition((FlxG.width / 2) - 10 - playButton.width, FlxG.height - playButton.height - 40);
		add(playButton);

		var optButton = new FlxButton('Options', click.bind('options'));
		optButton.setPosition((FlxG.width / 2) - 10 - playButton.width, FlxG.height - playButton.height - 10);
		add(optButton);

		#if sys
		var exitButton = new FlxButton((FlxG.width / 2) - 10, 80, 'X', click.bind('exit'));
		add(exitButton);
		#end

		super.create();

		FlxG.camera.fade(0.33, true);
	}

	function click(label:String) {
		switch(label.toLowerCase()) {
			case 'play': FlxG.camera.fade(0.3, FlxG.switchState.bind(new PlayState()));
			case 'options': FlxG.camera.fade(0.33, FlxG.switchState.bind(new OptionsState()));
			#if sys
			case 'exit': Sys.exit(0);
			#end
		}
	}
}
