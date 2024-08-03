package ui.menus;

import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;

class MainMenuState extends FlxSubState {
	static final TITLE_DIRECTORY = 'UI/Title Screen';

	override function create() {

		var playButton = new FlxButton('Play', click.bind('play'));
		playButton.setPosition(FlxG.width / 2 - 10 - playButton.width, FlxG.height - playButton.height - 70);
		add(playButton);

		var optButton = new FlxButton('Options', click.bind('options'));
		optButton.setPosition(FlxG.width / 2 - 10 - playButton.width, FlxG.height - playButton.height - 40);
		add(optButton);

		var exitButton = new FlxButton('Return', click.bind('exit'));
		exitButton.setPosition(FlxG.width / 2 - 10, FlxG.height - playButton.height - 10);
		add(exitButton);

		super.create();

		FlxG.camera.fade(1 / 3, true);
	}

	function click(label:String) {
		switch(label.toLowerCase()) {
			case 'play': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(play.PlayState.new));
			case 'options': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(OptionsState.new));
			#if sys
			case 'exit': close();
			#end
		}
	}
}