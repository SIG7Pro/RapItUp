package ui.menus;

import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;

class TitleState extends FlxState {
	static final TITLE_DIRECTORY = 'UI/Title Screen';

	override function create() {

		var purple = new FlxSprite(Paths.image('$TITLE_DIRECTORY/Purple'));
		purple.scale.y = MathUtil.percent(61.33);
		purple.updateHitbox();
		purple.y = -138;
		add(purple);

		var blue = new FlxSprite(Paths.image('$TITLE_DIRECTORY/Blue'));
		blue.scale.y = MathUtil.percent(19.31);
		blue.updateHitbox();
		blue.y = 360;
		add(blue);

		var white = new FlxSprite(Paths.image('$TITLE_DIRECTORY/White'));
		white.scale.y = MathUtil.percent(30.14);
		white.updateHitbox();
		white.y = 499;
		add(white);

		var mainFocus = new FlxSprite(Paths.image('$TITLE_DIRECTORY/Fellas/Main'));
		var reflectionSprite = new FlxSprite(Paths.image('$TITLE_DIRECTORY/Fellas/Black Fade/Black Fade Features'));
		add(reflectionSprite);
		add(mainFocus);

		var titleText = new FlxText('Rap-It-Up\nPrototype\n\n\n\n\nWork In Progress.');
		titleText.setFormat(Paths.font('vcr.ttf'), 22, CENTER);
		titleText.screenCenter(X);
		add(titleText);

		var playButton = new FlxButton('Start', click.bind('prestar'));
		playButton.setPosition(FlxG.width / 2 - 10 - playButton.width, FlxG.height - playButton.height - 70);
		add(playButton);

		var testButton = new FlxButton('test state', click.bind('moote'));
		testButton.setPosition(100, 100);
		//add(testButton);

		#if sys
		var exitButton = new FlxButton('X', click.bind('exit'));
		exitButton.setPosition(FlxG.width / 2 - 10, FlxG.height - playButton.height - 10);
		add(exitButton);
		#end

		super.create();

		FlxG.camera.fade(1 / 3, true);
	}

	function click(label:String) {
		switch(label.toLowerCase()) {
			case 'prestar': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(MainMenuState.new));
			#if sys
			//case 'moote' : FlxG.switchState.bind(MoveState.new);
			case 'exit': Sys.exit(0);
			#end
		}
	}

	/*override function update(elapsed:Float){
	
		if (FlxG.keys.anyPressed( [ESCAPE, BACKSPACE] ) )
			{
				Sys.exit(0);
				trace("Exiting.");
			}
	}*/
}