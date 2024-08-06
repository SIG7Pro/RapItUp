package ui.menus;

import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.util.FlxColor;

class MoveState extends FlxState {
	var imageTraversal:FlxSprite;
	var backerTrav:FlxSprite;
	var baseBG:FlxSprite;

	override function create() {

		FlxG.stage.window.title = "Background Testing";

		baseBG = new FlxSprite();
		baseBG.makeGraphic(1280, 720, 0xFF65e8ff);
		baseBG.screenCenter();
		add(baseBG);

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