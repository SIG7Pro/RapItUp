package ui.menus;

import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.util.FlxColor;

//import flixel.math.FlxRandom;
//import flixel.FlxG.random;
//import StdTypes.Float;

import flixel.util.FlxTimer;

class MoveState extends FlxState {
	public var firstImage:FlxSprite;
	public var secondBacker:FlxSprite;
	public var thirdSlot:FlxSprite;
	public var fourthButFirst:FlxSprite;
	// The sprites that are set to change.

	var baseBG:FlxSprite;

	var timerA:FlxTimer;
	var timerB:FlxTimer;
	var timerC:FlxTimer;
	var timerD:FlxTimer;


	override function create() {

		FlxG.stage.window.title = "Background Testing";

		baseBG = new FlxSprite();
		baseBG.makeGraphic(1280, 720, 0xff7ec2ce);
		baseBG.screenCenter();
		baseBG.alpha = 0.75;
		add(baseBG); // baseBG stays still!

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
		

		firstImage = new FlxSprite(Paths.image('Placeholder/MainMenu/bg/explison'));
		firstImage.screenCenter();
		firstImage.alpha = 0.01;
		add(firstImage);

		secondBacker = new FlxSprite(Paths.image('Placeholder/MainMenu/bg/semy'));
		secondBacker.screenCenter();
		secondBacker.alpha = 0.01;
		add(secondBacker);

		thirdSlot = new FlxSprite(Paths.image('Placeholder/MainMenu/bg/crudecad'));
		thirdSlot.screenCenter();
		thirdSlot.alpha = 0.01;
		add(thirdSlot);

		fourthButFirst = new FlxSprite(firstImage.graphic);
		fourthButFirst.screenCenter();
		fourthButFirst.alpha = 0.01;
		add(fourthButFirst);

		timerA = new FlxTimer();
		//timerB = new FlxTimer();
		timerB = new FlxTimer().start(3.0, num3fadein);
		timerC = new FlxTimer();
		timerD = new FlxTimer();

		super.create();
		FlxG.log.add("The FlxTimer has exist");
		moveNum1first();
	}

	function moveNum1first(){
		firstImage.alpha = 1;
		firstImage.velocity.x = 5;
		timerA.start(1, num2fadein, 99);
		//for (i in 0...10) {
			//timer.start(1, noEvent, 10);
			

		 //}
		 
		 
		// timerB.wait(4);
		 //timerB.start(1, num3fadein, 99);
		 //trace("Image 3 Faded In");
		 //timerC.start(8, num4fadein, 99);
		 //trace("Image 4 Faded In");
	}

	function num2fadein(_):Void{
		secondBacker.alpha += 0.01;
	}
	function num3fadein(_):Void{
		thirdSlot.alpha += 0.01;
	}
	function num4fadein(_):Void{
		fourthButFirst.alpha += 0.01;
	}


	function noEvent(_):Void{

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