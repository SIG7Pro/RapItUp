package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxColor;

class Arrow extends FlxSprite
{
     var placeholderLocation:String = "assets/images/Placeholder/";
     var Arrows:FlxSprite;
     

	public function create()
	{
		Arrows = new FlxSprite();
		
		/*var tex = FlxAtlasFrames.fromSparrow(placeholderLocation + "FNFArrows.png", placeholderLocation + "FNFArrows.xml");
		frames = tex;*/

		//screenCenter();
		
		// Friday Night Funkin's arrow colors are as follows:
		// Purple for left.
		// Blue for down.
		// Green for up.
		// And red for right.
		
		// Of course, these are placeholders.

		animation.addByPrefix('purpleScroll', 'purple instance'); // <-
		animation.addByPrefix('purplehold', 'purple hold piece'); // |
		animation.addByPrefix('purpleholdend', 'pruple end hold');// U

		animation.addByPrefix('blueScroll', 'blue instance'); // \|/
 		animation.addByPrefix('bluehold', 'blue hold piece'); //  |
		animation.addByPrefix('blueholdend', 'blue hold end'); // U

		animation.addByPrefix('greenScroll', 'green instance'); // /|\
		animation.addByPrefix('greenhold', 'green hold piece'); //  |
		animation.addByPrefix('greenholdend', 'green hold end'); // U

		
		animation.addByPrefix('redScroll', 'red instance'); // ->
		animation.addByPrefix('redhold', 'red hold piece'); // |
		animation.addByPrefix('redholdend', 'red hold end');// U

		
		
		

		updateHitbox();
		
		//playAnim('greenScroll');
		//animation.play('greenScroll');
		
		/*scale = 0.7;*/ setGraphicSize(0.7);
		//add(Arrows);
		
		
	}

	/*override public function update(elapsed:Float)
	{

	}*/
}
