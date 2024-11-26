package play;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import haxe.io.Path;
import flixel.FlxState;

import flixel.util.FlxColor;
import flixel.FlxCamera;

import flixel.ui.FlxBar; // Health Bar Stuff
import flixel.ui.FlxButton; // Health Bar Testing
import flixel.text.FlxText;
import flixel.input.keyboard.FlxKey;

import Std;

//import play.Conductor;
import play.ArrowStaff;

// Reference code: https://github.com/yophlox/Moon4K/blob/main/source/states/PlayState.hx
// (Hard to understand.)

class PlayState extends FlxState {
	static inline var placeholderLocation = 'assets/images/Placeholder/';

	var hudCam:FlxCamera;
	var gameCam:FlxCamera;

	//var healthBar:FlxBar;
	var health:Float = 50;
	
	var scoreTxt:FlxText;
	var scoreValue:Float = 0;

	var hpBarOverlay:FlxSprite;

	var strumLine:FlxTypedGroup<FlxSprite>;
	var mainKeys:Array<Array<FlxKey>> = [[A, LEFT], [S, DOWN], [W, UP], [D, RIGHT]];
	var isUpscroll:Bool = true;
	
	// Experimenting with note spawning.
	var playArrows:FlxTypedGroup<FlxSprite>;
	var scrollSpeed:Float = 2.0; // Int users shall have a rough time.
	var playingArrow:FlxSprite;
	
	var curRanking:String = "N/A";
	var canBeHit:Bool = false;


	override function create() {
	trace("PlayState.hx initiated.");

		var sprite = new FlxSprite();
		sprite.makeGraphic(FlxG.width, FlxG.height, FlxColor.BROWN);
		sprite.screenCenter();
		sprite.alpha = 0.5;
		add(sprite); // Just so the background behind the placeholder graphics isn't completely black.

		strumLine = new FlxTypedGroup<FlxSprite>();
		add(strumLine);
		
		//playArrows = new FlxTypedGroup<FlxSprite>();
		//add(playArrows);

		var hpStuff = new HealthBar();
		add (hpStuff);

		hudCam = new FlxCamera();
		hudCam.bgColor.alpha = 0;
		FlxG.cameras.add(hudCam);

		gameCam = new FlxCamera();
		gameCam.bgColor.alpha = 0;
		FlxG.cameras.add(gameCam);

		makeStrumline();

		super.create();

	}

	public function makeStrumline()
	{
		for (i in 0...2) 
		{
			for (j in 0...4) 
			{
					//var babyArrow:FlxSprite = new FlxSprite(50 + (120 * j) + (FlxG.width / 1.875) * i, isUpscroll ? 50 : FlxG.height - 150).makeGraphic(112, 112, 0xff87a3ad);
					// (id:Int, insertedX:Int, insertedY:Int, sizeX:Int, sizeY:Int, insertedColor:FlxColor) ArrowStaff
					var mslInsertID:Int = (i * j);
					var mslInsertX:Float = (50 + (120 * j) + (FlxG.width / 1.875) * i);
					var mslInsertY:Float = (isUpscroll ? 50 : FlxG.height - 150);
					

					// x = 50 + (120 * j) + (FlxG.width / 1.875) * i
					// y = isUpscroll ? 50 : FlxG.height - 150 // If upscroll then Y = 50, if downscroll then 150.

					//babyArrow.alpha = 0.5;
					var babyArrow:ArrowStaff = new ArrowStaff(mslInsertID, mslInsertX, mslInsertY, 154, 157, 0xff87a3ad);
					strumLine.add(babyArrow);
			}
		}
	}	
	
	public function keyCheck(data:Int)
	{
		if (FlxG.keys.anyPressed(mainKeys[data])) 
		{
			strumLine.members[data+4].scale.set(0.95, 0.95);
			
			if (canBeHit = true) 
			{
			 scoreValue += 10;
			 health += 0.2;
			}
			else
			{
			 scoreValue -= 10;
			 health -= 0.2;
			}
			
		} 
		else {
			strumLine.members[data+4].scale.set(1, 1);
		
		}
		
	}			

	override function update(elapsed:Float){
	
		if (FlxG.keys.anyPressed( [ESCAPE, BACKSPACE] ) )
			{
				FlxG.switchState(ui.menus.MainMenuState.new);
				FlxG.stage.window.title = "Rap-It-Up";
				trace("Returning to Title.");
			}
		
		if (FlxG.keys.justPressed.X)
			{
				//
			}
	
	}
}
