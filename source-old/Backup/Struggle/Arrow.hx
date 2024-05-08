package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxColor;

class Arrow extends FlxSprite
{
     var placeholderLocation:String = "assets/images/Placeholder/";
     var Arrows:FlxSprite;
     
     var ArrowFocus:Bool;
     var ArrowType:Bool;
     
     //(Float = number w decimal, Bool = true/false, Int is a whole number, Text is a string)
     

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

		animation.addByPrefix('purpleScroll', 'purple instance'); // ⬅
		animation.addByPrefix('purplehold', 'purple hold piece'); // |
		animation.addByPrefix('purpleholdend', 'pruple end hold');// U

		animation.addByPrefix('blueScroll', 'blue instance'); //  ⬇
 		animation.addByPrefix('bluehold', 'blue hold piece'); //  |
		animation.addByPrefix('blueholdend', 'blue hold end'); // U

		animation.addByPrefix('greenScroll', 'green instance'); //  ⬆
		animation.addByPrefix('greenhold', 'green hold piece'); //  |
		animation.addByPrefix('greenholdend', 'green hold end'); // U

		
		animation.addByPrefix('redScroll', 'red instance'); // ️➡
		animation.addByPrefix('redhold', 'red hold piece'); // |
		animation.addByPrefix('redholdend', 'red hold end');// U

		updateHitbox();
		configArrows();
		
		y = 15;
		
		if (ArrowFocus = "true"){
	             Arrow.alpha == 1;
		}
		else{
		     Arrow.alpha == 0.5;
		}

		/*if (ArrowType = "opponent"){
		     Arrow.x == 13;
		}
		else{ // Note to self, I accidentally put a colon instead of an equal sign when this was a seperate if thing, and it gave me: source/Arrow.hx:69: characters 17-18 : Expected ) so yeah.
		     Arrow.x == 50;
		}*/
		
		//playAnim('greenScroll');
		//animation.play('greenScroll');
		
		/*scale = 0.7;*/ setGraphicSize(0.7);
		//add(Arrows);
		
		
	}
	
	public function configArrows(param1:Bool, param2:Bool){ // Param 1: Note type, opponent or player? // Param 2: Visiblity. Focus or No Focus. True or False. No focus makes it 50% visible.
	// https://discord.com/channels/162395145352904705/165234904815239168/1228126943614861422 
	// https://discord.com/channels/162395145352904705/162395145352904705/1228129453603950622 (float = number w decimal, bool = true/false, int is a whole number, text is a string)
	// tysm
	
	// ('opponent', 'false');
	
	// arrowFocus
        // arrowType
	// both bools?
	
	      /*if (param1 = "opponent" || !param1 = "player"){
	        Arrow.x == 13;
	     }
	     else{ // Note to self, I accidentally put a colon instead of an equal sign when this was a seperate if thing, and it gave me: source/Arrow.hx:69: characters 17-18 : Expected ) so yeah.
	        Arrow.x == 50;
	     }
	
	    if (arrowFocus){
	        Arrow.alpha == 1;
	     }
	     else{
	        Arrow.alpha == 0.5;
	     }*/
	     
	     /*if (param1){ // Checks the arrow type. (True classifies it as an opponent arrow. False classifies it as the player's.)
	        ArrowType == "opponent";
	     }
	     else{
	        ArrowType == "player";
	     }
	
	    if (param2){ // Checks the focus. (True focuses it and false unfocuses it.)
	        ArrowFocus == "true";
	     }
	     else{
	        ArrowFocus == "false";
	     }*/
	
	
	}

	/*override public function update(elapsed:Float)
	{

	}*/
}
