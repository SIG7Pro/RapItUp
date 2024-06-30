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

class PlayState extends FlxState {
	static inline var placeholderLocation = 'assets/images/Placeholder/';

	var healthBar:FlxBar;
	var health:Float = 50;
	
	var scoreTxt:FlxText;
	var scoreValue:Float = 0;

	var hpBarOverlay:FlxSprite;

	// lantern engine shiz (hi - ty dot cee ess) // no swearing, this is a Christian minecraft server
	var translineArrows:FlxTypedGroup<FlxSprite>;	
	var mainKeys:Array<Array<FlxKey>> = [[A, LEFT], [S, DOWN], [W, UP], [D, RIGHT]];
	var isUpscroll:Bool = true;
	
	// Experimenting with note spawning.
	var playArrows:FlxTypedGroup<FlxSprite>;
	var scrollSpeed:Float = 2.0; // Int users shall have a rough time.
	var playingArrow:FlxSprite;
	
	var curRanking:String = "N/A";
	var canBeHit:Bool = false;
	
	var mightberemovedSomeday:Float = 1.0; // this is painful


	override function create() {

		var sprite = new FlxSprite();
		sprite.makeGraphic(FlxG.width, FlxG.height, FlxColor.BROWN);
		sprite.screenCenter();
		sprite.alpha = 0.5;
		add(sprite); // Just so the background behind the placeholder graphics isn't completely black.
		
		trace("PlayState.hx initiated.");
		var placeholderBG = Path.join([placeholderLocation, 'Placeholder.png']);

		var placeholderGraphic = new FlxSprite(placeholderBG);
		placeholderGraphic.screenCenter();
		placeholderGraphic.alpha = 0.5;
		//add(placeholderGraphic);

		var plcGrRed = new FlxSprite(placeholderBG);
		plcGrRed.screenCenter();
		plcGrRed.alpha = 0.25;
		plcGrRed.y += 15;
		plcGrRed.color = 0xffff0000;
		//add(plcGrRed);

		var easing = FlxEase.quadInOut;
		FlxTween.tween(placeholderGraphic, {y: plcGrRed.y + 50}, 0.6, {ease: easing, type: PINGPONG, startDelay: 0.1});
		FlxTween.tween(plcGrRed, {y: plcGrRed.y + 50}, 0.6, {ease: easing, type: PINGPONG});

		translineArrows = new FlxTypedGroup<FlxSprite>();
		add(translineArrows);
		
		playArrows = new FlxTypedGroup<FlxSprite>();
		add(playArrows);


		makeStrumline();

		super.create();
		
		
		
		//The HP Bar
		healthBar = new FlxBar(397 - 1, 625 - 1, RIGHT_TO_LEFT, 593 + 1, 13 + 1, null, "health", 0, 100, false);
		healthBar.createFilledBar(0xFFff1064, 0xFF0cffb6, false);
		healthBar.value = health;	
		// Score Text (Should be infront of the bar overlay, but its hard to give notice.)
		scoreTxt = new FlxText(27.08, FlxG.height - 40, 0, 'Wahoo.');
		scoreTxt.setFormat("assets/fonts/captura-now-regular.otf", 22, LEFT);
		scoreTxt.x = 770;
		scoreTxt.y = 656;
		// The actual overlay, fantastic.
		hpBarOverlay = new FlxSprite("assets/images/UI/HPBarOverlay.png");
		hpBarOverlay.x = 390;
		hpBarOverlay.y = 617;
		hpBarOverlay.updateHitbox();

		for (infoOverlay in [scoreTxt, healthBar, hpBarOverlay]) 
		add(infoOverlay);

		//ovrl 390 617
		//bar 397 625

		// text 770 656 size 27.08 height height minus 510 er 624
		//idk if it was upscroll it'd be 43 Y text
		// 2 pixel stroke

		
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
					mightberemovedSomeday == playingArrow.y;
					
					/*
					Things To Note (Upscroll)
					
					The Y axis where the strumlines are at (or at least where the OG tween ended at) was at Y 50.
					Below, the Y is 162.
					Above is like -62.
					
					So in theory, one could say places of hitting could be like:
					50 - Perfect
					80 / -30 - Good
					110 / -60? - Meh
					130 / -80? - Bad
					140 / -90? - Worse
					
					162 / -62 - Too Early / Missing
					
					Things in question marks aren't confirmed. Too lazy to.
					
					*/
					
					// Tween based off of an older commit. Edited however.
					// https://github.com/SIG7Pro/RapItUp/blob/92ec3a93dd1824bc61f780cb13d53162b1dd640b/source/PlayState.hx
					FlxTween.tween(playingArrow, {y: isUpscroll ? 50 - 150 : FlxG.height - 150 }, scrollSpeed);
					// A value closer to zero speeds up the note, while a value farther from it decreases the speed.
					// Setting the last value to 0.5 makes it really fast! 1.4 is a moderate speed, 2.0 is pretty good.
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
				/*if (mightberemovedSomeday = 50)
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
	
	
	   //trace("uy.");
		if (FlxG.keys.anyPressed( [ESCAPE, BACKSPACE] ) )
			{
				FlxG.switchState(ui.menus.TitleState.new);
				trace("Returning to Title.");
			}
		if (FlxG.keys.anyPressed( [O, P] ) )
			{
				FlxG.switchState(ui.menus.OptionsState.new);
				trace("Going to Options.");
			}
		//#if debug
		if (FlxG.keys.anyPressed([I, R]) )
			{
				scoreValue += 2;
				health += 2;
				//trace("🏳‍⚧Isdf.");
			}
		if (FlxG.keys.anyPressed([K, F]) )
			{
				scoreValue -= 2;
				health -= 2;
				//trace("🏳‍🌈Isdf.");
			}
		//#end
		
		if (FlxG.keys.justPressed.X)
			{
				// Hopefully spawns an arrow.
				makeArrowHitter();
			}
			
	healthBar.value = health;
	scoreTxt.text = "Score:" + scoreValue + "\n" + curRanking;


		for (i in 0...mainKeys.length) {
			keyCheck(i);
		}

	/*if (playingArrow.y > -62 && playingArrow.y < 162){
		canBeHit = true;
		
		//


		}*/
	
	}
}
