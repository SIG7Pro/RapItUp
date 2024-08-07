package ui.menus;

import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.util.FlxColor;

import flixel.math.FlxRandom;
import flixel.FlxG.random;
import StdTypes.Float;

class MoveState extends FlxState {
	public var firstImage:FlxSprite;
	public var secondBacker:FlxSprite;
	public var thirdSlot:FlxSprite;
	// The sprites that are set to move.
	public var dirX:Float = Math.random();
	public var direY:Float;
	//funny

	var baseBG:FlxSprite;
	public var titleText:FlxText;

	override function create() {

		// Notes to self:
		// FlxVelocity.fromAngle
		// https://  channels/162395145352904705/165234904815239168/1270174962849939498 haxe server
		// https://api.haxeflixel.com/flixel/math/FlxVelocity.html

		//dirX == flixel.FlxG.random(0, 90);
		//direY == 90 - dirX;

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
		firstImage.alpha = 0.001;
		add(firstImage);

		secondBacker = new FlxSprite(Paths.image('Placeholder/MainMenu/bg/semy'));
		secondBacker.screenCenter();
		secondBacker.alpha = 0.001;
		add(secondBacker);

		thirdSlot = new FlxSprite(Paths.image('Placeholder/MainMenu/bg/crudecad'));
		thirdSlot.screenCenter();
		thirdSlot.alpha = 0.001;
		add(thirdSlot);

		titleText = new FlxText('Testing Vairbales');
		titleText.setFormat(Paths.font('vcr.ttf'), 22, CENTER);
		titleText.screenCenter(X);
		titleText.color = 0xffda3c5e;
		add(titleText);

		super.create();

		
		moveNum1();
	}

	function moveNum1(){
		// best haxe code https://discord.com/channels/162395145352904705/165234904815239168/1270782099502403656
		firstImage.alpha = 1;
		titleText.text == "Variables\ndirX =" + dirX;
		firstImage.velocity.x = 5;

		for (i in 0...10) {
			//code here
			
			//firstImage.velocity.y = direY;

		 }


	}

	override function update(elapsed:Float){
	titleText.text == "Variables\ndirX =" + dirX;
	firstImage.velocity.x = dirX;
		if (FlxG.keys.anyPressed( [ESCAPE, BACKSPACE] ) )
			{
				FlxG.switchState(ui.menus.TitleState.new);
				FlxG.stage.window.title = "Rap-It-Up";
				trace("Returning to Title.");
			}
	}
}