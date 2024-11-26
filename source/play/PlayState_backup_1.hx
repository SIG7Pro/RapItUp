package play;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import haxe.io.Path;
import flixel.FlxState;

import flixel.util.FlxColor;

import flixel.ui.FlxBar; // Health Bar Stuff
import flixel.ui.FlxButton; // Health Bar Testing
import flixel.text.FlxText;
import flixel.input.keyboard.FlxKey;

// Reference code: https://github.com/yophlox/Moon4K/blob/main/source/states/PlayState.hx
// (Hard to understand.)

class PlayState extends FlxState {
	static inline var placeholderLocation = 'assets/images/Placeholder/';

	var hudCam:FlxCamera;
	var gameCam:FlxCamera;

	var healthBar:FlxBar;
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
		
		playArrows = new FlxTypedGroup<FlxSprite>();
		add(playArrows);


		makeStrumline();

		super.create();
		
		hudCam = new FlxCamera();
		hudCam.bgColor.alpha = 0;
		FlxG.cameras.add(hudCam);

		gameCam = new FlxCamera();
		gameCam.bgColor.alpha = 0;
		FlxG.cameras.add(gameCam);
		
		healthBar = new FlxBar(397 - 1, 625 - 1, RIGHT_TO_LEFT, 593 + 1, 13 + 1, null, "health", 0, 100, false);
		healthBar.createFilledBar(0xFFff1064, 0xFF0cffb6, false);
		healthBar.value = health;	
		scoreTxt = new FlxText(27.08, FlxG.height - 40, 0, 'Wahoo.');
		scoreTxt.setFormat("assets/fonts/monsterrat.ttf", 22, LEFT);
		scoreTxt.x = 770;
		scoreTxt.y = 656 - 10;
		scoreTxt.setBorderStyle(OUTLINE, FlxColor.BLACK, 2);
		hpBarOverlay = new FlxSprite("assets/images/UI/HPBarOverlay.png");
		hpBarOverlay.x = 390;
		hpBarOverlay.y = 617;
		hpBarOverlay.updateHitbox();

		for (infoOverlay in [scoreTxt, healthBar, hpBarOverlay]) 
		add(infoOverlay);
		scoreTxt.cameras = [hudCam];
		healthBar.cameras = [hudCam];
		hpBarOverlay.cameras = [hudCam];

		
	}

	public function makeStrumline()
	{
		for (i in 0...2) 
		{
			for (j in 0...4) 
			{
					var babyArrow:FlxSprite = new FlxSprite(50 + (120 * j) + (FlxG.width / 1.875) * i, isUpscroll ? 50 : FlxG.height - 150).makeGraphic(112, 112, 0xff87a3ad);
					//babyArrow.alpha = 0.5;
					translineArrows.add(babyArrow);
			}
		}
	}	
	
	public function makeArrowHitter() //makeStrumline but worsenede.
	{
		for (i in 0...2) 
		{
			for (j in 0...4) 
			{
					var thingAmajig:Int = FlxG.height + 2;
					playingArrow = new FlxSprite(50 + (120 * j) + (FlxG.width / 1.875) * i, isUpscroll ? 50 + thingAmajig: FlxG.height - 150).makeGraphic(112, 112, 0xffc24b99);
					playArrows.add(playingArrow);
					FlxG.watch.add(playingArrow, "y"); // https://haxeflixel.com/documentation/debugger/

			}
		}
	}	
	
	public function keyCheck(data:Int)
	{
		if (FlxG.keys.anyPressed(mainKeys[data])) 
		{
			translineArrows.members[data+4].scale.set(0.95, 0.95);
			
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
				/*if (mightberemovedSomeday = 50) // Seems to be distance ranks.
				{
					curRanking = "Sweet";
					trace("Perfect!!");
				}
				else if (mightberemovedSomeday > 50 && mightberemovedSomeday < 80)
				{
					curRanking = "Good";
					trace("Good!");
				}
				else if (mightberemovedSomeday > 110 && mightberemovedSomeday < 80)
				{
					curRanking = "Meh";
					trace("Meh");
				}
				else if (mightberemovedSomeday > 130 && mightberemovedSomeday < 80)
				{
					curRanking = "Back";
					trace("Bad");
				}
				else if (mightberemovedSomeday > 140 && mightberemovedSomeday < 80)
				{
					curRanking = "Wad";
					trace("Wack...");
				}	*/
			
		} 
		else {
			translineArrows.members[data+4].scale.set(1, 1);
		
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
				// Hopefully spawns an arrow.
				makeArrowHitter();
			}
			
		healthBar.value = health;
		scoreTxt.text = "Score:  " + scoreValue/* + "\n" + curRanking*/;


		for (i in 0...mainKeys.length) {
			keyCheck(i);
		}

	/*if (playingArrow.y > -62 && playingArrow.y < 162){
		canBeHit = true;
		
		//


		}*/
	
	}
}
