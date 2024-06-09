package ui.menus;

import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxState;

class OptionsState extends FlxState {
	override function create() {
		var titleText = new FlxText('Options\n{This is being worked on, and there is currently no\noptions ready.}');
		titleText.setFormat(22, CENTER);
		titleText.screenCenter(X);
		add(titleText);

		var returnButton = new FlxButton('Return', FlxG.switchState.bind(TitleState.new));
		returnButton.setPosition(FlxG.width / 2 - 10 - returnButton.width, FlxG.height - returnButton.height - 10);
		add(returnButton);
		
		super.create();
	}
}