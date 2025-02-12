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

import play.ConductorFV;
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
	
	var curRanking:String = "N/A";
	var canBeHit:Bool = false;


	override function create() {
		trace("PlayState.hx initiated.");

		var sprite = new FlxSprite();
		sprite.makeGraphic(FlxG.width, FlxG.height, FlxColor.BROWN);
		sprite.screenCenter();
		sprite.alpha = 0.5;
		add(sprite);

		strumLine = new FlxTypedGroup<FlxSprite>();
		add(strumLine);
		playArrows = new FlxTypedGroup<FlxSprite>();
		add(playArrows);

		//var hpStuff = new HealthBar();
		//add (hpStuff);

		hudCam = new FlxCamera();
		hudCam.bgColor.alpha = 0;
		FlxG.cameras.add(hudCam);

		gameCam = new FlxCamera();
		gameCam.bgColor.alpha = 0;
		FlxG.cameras.add(gameCam);

		makeStrumline();
		makePlayNote(3, 2);

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
					var makeStrumInsertID:Int = (i * j);
					var makeStrumInsX:Float = (33 + (120 * j) + (FlxG.width / 1.875) * i);
					var makeStrumInsY:Float = (isUpscroll ? 50 : FlxG.height - 150);
					

					// x = 50 + (120 * j) + (FlxG.width / 1.875) * i
					// y = isUpscroll ? 50 : FlxG.height - 150 // If upscroll then Y = 50, if downscroll then 150.

					var babyArrow:ArrowStaff = new ArrowStaff(makeStrumInsertID, makeStrumInsX, makeStrumInsY, 154, 157, 0xff87a3ad, 0);
					babyArrow.scale.set(0.75, 0.75);
					babyArrow.updateHitbox();
					strumLine.add(babyArrow);
			}
		}
	}	

	//public var makePlayNotesInsX:Float;

	public function makePlayNote(value:Int, speed:Float) // 1-4 Opp / 5-8 Play //
	{
		//for (i in 0...2){
			//for (j in 0...4){
					scrollSpeed = speed;

					var makePlayNotesID:Int = value;
					var makePlayNotesInsX:Float = 0;

					switch makePlayNotesID { // Sets the X probably.
						case 1: makePlayNotesInsX = (33 + (120 * 1) + (FlxG.width / 1.875) * 0); // Lazy but maybe worth it.
						case 2: makePlayNotesInsX = (33 + (120 * 2) + (FlxG.width / 1.875) * 0);
						case 3: makePlayNotesInsX = (33 + (120 * 3) + (FlxG.width / 1.875) * 0);
						case 4: makePlayNotesInsX = (33 + (120 * 4) + (FlxG.width / 1.875) * 0);

						case 5: makePlayNotesInsX = (33 + (120 * 1) + (FlxG.width / 1.875) * 1);
						case 6: makePlayNotesInsX = (33 + (120 * 2) + (FlxG.width / 1.875) * 1);
						case 7: makePlayNotesInsX = (33 + (120 * 3) + (FlxG.width / 1.875) * 1);
						case 8: makePlayNotesInsX = (33 + (120 * 4) + (FlxG.width / 1.875) * 1);
						//default: default-expression;
					}
					var makePlayNotesInsY:Float;

					var childPlayArrow:ArrowStaff = new ArrowStaff(makePlayNotesID, makePlayNotesInsX, -10, 154, 157, 0xff87a3ad, scrollSpeed);
					childPlayArrow.scale.set(0.75, 0.75);
					childPlayArrow.updateHitbox();



					if (isUpscroll){
						childPlayArrow.y = FlxG.height + (childPlayArrow.height) - 200;
					}else{
						childPlayArrow.y = (FlxG.height + (childPlayArrow.height) - 200) * -1;
					}

					var playNoteSpawnY:Float = childPlayArrow.y;

					trace(childPlayArrow.y + ' start height');
					playArrows.add(childPlayArrow);

					playArrows.members[0].color = FlxColor.CYAN;
					//playArrows.members[0].velocity.y = scrollSpeed;



			//}
		//}
	}

	public function keyCheck(data:Int)
	{
		if (FlxG.keys.anyPressed(mainKeys[data])) 
		{
			trace("Hit");
			strumLine.members[data+4].scale.set(0.65, 0.65);
			
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
			strumLine.members[data+4].scale.set(0.75, 0.75);
		
		}
	}

	override function update(elapsed:Float){
	
		if (FlxG.keys.anyPressed( [ESCAPE, BACKSPACE] ) )
			{
				FlxG.switchState(ui.menus.MainMenuState.new);
				trace("Returning to Title.");
			}
		
		if (FlxG.keys.justPressed.W)
			{
				//
				makePlayNote(5,2);
				trace("Launch!");
			}

		changeColor();
		//keyCheck(1);
		for (i in 0...mainKeys.length) {
			keyCheck(i);
		}

	}

	function changeColor(){

			// Strum members start from zero.
			strumLine.members[0].color = FlxColor.RED;
			strumLine.members[1].color = FlxColor.RED;
			strumLine.members[2].color = FlxColor.RED;
			strumLine.members[3].color = FlxColor.RED;
			strumLine.members[4].color = FlxColor.GREEN;
			strumLine.members[5].color = FlxColor.GREEN;
			strumLine.members[6].color = FlxColor.GREEN;
			strumLine.members[7].color = FlxColor.GREEN;

	}

	function makePlayArrowsMove(){

			// Strum members start from zero.
			//playArrows.members[cur].velocity.y;

	}
}
