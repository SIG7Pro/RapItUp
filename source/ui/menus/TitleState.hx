package ui.menus;

import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxState;

class TitleState extends FlxState {
	static final TITLE_DIRECTORY = 'UI/Title Screen';
	static final LINUX_PRETTY_NAME = 'cat /etc/*-release | grep "PRETTY_NAME" | sed ' + "'" + 's/PRETTY_NAME=//g' + "'" + " | sed 's/" + '"//g' + "'";
	
	override function create() {
		#if linux
		trace('You are running');
		Sys.command(LINUX_PRETTY_NAME);
		trace('(${Sys.systemName})');
		#else
		trace(Sys.systemName);
		#end

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
		add(mainFocus);

		var reflectionSprite = new FlxSprite(Paths.image('$TITLE_DIRECTORY/Fellas/Black Fade/Black Fade Features'));
		add(reflectionSprite);

		var titleText = new FlxText('Rap-It-Up\nPrototype\n\n\n\n\nWork In Progress.');
		titleText.setFormat(Paths.font('vcr.ttf'), 22, CENTER);
		titleText.screenCenter(X);
		add(titleText);

		var playButton = new FlxButton('Play', click.bind('play'));
		playButton.setPosition(FlxG.width / 2 - 10 - playButton.width, FlxG.height - playButton.height - 70);
		add(playButton);

		var optButton = new FlxButton('Options', click.bind('options'));
		optButton.setPosition(FlxG.width / 2 - 10 - playButton.width, FlxG.height - playButton.height - 40);
		add(optButton);

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
			case 'play': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(play.PlayState.new));
			case 'options': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(OptionsState.new));
			#if sys
			case 'exit': Sys.exit(0);
			#end
		}
	}
}