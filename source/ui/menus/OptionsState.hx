package ui.menus;

import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.util.FlxColor;

class OptionsState extends FlxState {
	override function create() {
		FlxG.stage.window.title = "Rap-It-Up: Options";

		var pretty = new FlxSprite(Paths.image('UI/Title Screen/pretty'));
		pretty.updateHitbox();
		pretty.alpha = 0.4;
		add(pretty);

		var purple = new FlxSprite(Paths.image('UI/Title Screen/Purple'));
		purple.flipY = true;
		purple.updateHitbox();
		purple.alpha = 0.15;
		add(purple);

		var glossLine1 = new FlxSprite(Paths.image('UI/Options Menu/GlossLine'));
		glossLine1.scale.x = 0.5;
		glossLine1.updateHitbox();
		glossLine1.y = 34;
		glossLine1.x = 0;
		add(glossLine1);

		var glossLine2 = new FlxSprite(Paths.image('UI/Options Menu/GlossLine'));
		glossLine2.scale.x = 0.5;
		glossLine2.y = 34;
		glossLine2.x = 640; // Screen width divided by two.
		glossLine2.flipX = true;
		glossLine2.updateHitbox();
		add(glossLine2);

		var bigBlackRectangle = new FlxSprite();
		bigBlackRectangle.makeGraphic(833, 367, FlxColor.BLACK);
		bigBlackRectangle.x = 222;
		bigBlackRectangle.y = 224;
		bigBlackRectangle.screenCenter(X);
		bigBlackRectangle.alpha = 0.2;
		add(bigBlackRectangle);

		var smallBlackRectangle = new FlxSprite();
		smallBlackRectangle.makeGraphic(509, 74, FlxColor.BLACK);
		smallBlackRectangle.x = 386;
		smallBlackRectangle.y = 615;
		smallBlackRectangle.screenCenter(X);
		smallBlackRectangle.alpha = 0.2;
		add(smallBlackRectangle);

		var ThatOneAstrominuMenuConceptSquiggle = new FlxSprite(Paths.image('UI/Options Menu/AstronimuConceptSquiggle'));
		ThatOneAstrominuMenuConceptSquiggle.updateHitbox();
		ThatOneAstrominuMenuConceptSquiggle.y = 85;
		ThatOneAstrominuMenuConceptSquiggle.x = -14;
		add(ThatOneAstrominuMenuConceptSquiggle);

		var titleText = new FlxSprite(Paths.image('UI/Options Menu/Options Text'));	
		titleText.x = 469;
		titleText.screenCenter(X);
		titleText.x += 3;
		titleText.y = 14;
		titleText.updateHitbox();
		add(titleText);

		//var ref = new FlxSprite(Paths.image('UI/Options Menu/Option-Zone')); // To confirm everything is where it needs to be.
		//ref.screenCenter();
		//ref.updateHitbox();
		//ref.alpha = 0.3;
		//add(ref);

		//var returnButton = new FlxButton('Return', FlxG.switchState.bind(TitleState.new));
		//returnButton.setPosition(FlxG.width / 2 - 10 - returnButton.width, FlxG.height - returnButton.height - 10);
		//add(returnButton);

		//628 Y Option Category Thing
		// Screen Centered
		
		super.create();
	}

	override function update(elapsed:Float){
	
		if (FlxG.keys.anyPressed( [ESCAPE, BACKSPACE] ) )
			{
				FlxG.switchState(ui.menus.TitleState.new);
				FlxG.stage.window.title = "Rap-It-Up";
				trace("Returning to Title.");
			}
	}
}