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

import openfl.system.System;


class PlayState extends FlxState {
	static inline var placeholderLocation = 'assets/images/Placeholder/';

	var healthBar:FlxBar;
	var health:Float = 50;
	
	var scoreTxt:FlxText;
	var scoreValue:Float = 0;

	var hpBarOverlay:FlxSprite;

	// lantern engine shiz (hi - ty dot cee ess) // no swearing this is a Christian minecraft server
	var translineArrows:FlxTypedGroup<FlxSprite>;	
	var mainKeys:Array<Array<FlxKey>> = [[A, LEFT], [S, DOWN], [W, UP], [D, RIGHT]];
	var isUpscroll:Bool = true;
	
	var mem:Float = Math.round(System.totalMemory / 1024 / 1024 * 100)/100;
	var memPeak:Float = 0;


	override function create() {
		trace(" I Can trace and do\na new line?");
		var sprite = new FlxSprite();
		sprite.makeGraphic(FlxG.width, FlxG.height, FlxColor.BROWN);
		sprite.screenCenter();
		add(sprite); // Just so the background behind the placeholder graphics isn't completely black.
		
		trace("PlayState.hx initiated.");
		var placeholderBG = Path.join([placeholderLocation, 'Placeholder.png']);

		var placeholderGraphic = new FlxSprite(placeholderBG);
		placeholderGraphic.screenCenter();
		placeholderGraphic.alpha = 0.5;
		add(placeholderGraphic);

		var plcGrRed = new FlxSprite(placeholderBG);
		plcGrRed.screenCenter();
		plcGrRed.alpha = 0.25;
		plcGrRed.y += 15;
		plcGrRed.color = 0xffff0000;
		add(plcGrRed);

		var easing = FlxEase.quadInOut;
		FlxTween.tween(placeholderGraphic, {y: plcGrRed.y + 50}, 0.6, {ease: easing, type: PINGPONG, startDelay: 0.1});
		FlxTween.tween(plcGrRed, {y: plcGrRed.y + 50}, 0.6, {ease: easing, type: PINGPONG});

		translineArrows = new FlxTypedGroup<FlxSprite>();
		add(translineArrows);

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
		//scoreTxt.screenCenter(X);
		// The actual overlay, fantastic.
		hpBarOverlay = new FlxSprite("assets/images/UI/HPBarOverlay.png");
		hpBarOverlay.x = 390;
		hpBarOverlay.y = 617;
		hpBarOverlay.updateHitbox();
		/*add(hpBarOverlay);
		add(healthBar);
		add(scoreTxt);*/

		for (spr in [scoreTxt, healthBar, hpBarOverlay]) 
		add(spr);

		//ovrl 390 617
		//bar 397 625

		// text 770 656 size 27.08 height height minus 510 er 624
		//idk if it was upscroll it'd be 43 Y text
		// 2 pixel stroke

		
	}

	public function keyCheck(data:Int)
	{
		if (FlxG.keys.anyPressed(mainKeys[data])) 
		{
			translineArrows.members[data+4].scale.set(0.95, 0.95);
		} 
		else 
			translineArrows.members[data+4].scale.set(1, 1);
	}	

	public function makeStrumline()
	{
		for (i in 0...2) 
		{
			for (j in 0...4) 
			{
					var babyArrow:FlxSprite = new FlxSprite(50 + (120 * j) + (FlxG.width / 1.875) * i, isUpscroll ? 50 : FlxG.height - 150).makeGraphic(112, 112, 0xFF666666);
					babyArrow.alpha = 0.5;
					translineArrows.add(babyArrow);
			}
		}
	}			

	override function update(elapsed:Float){
	
	if (mem > memPeak) memPeak = mem;
	
	
	   //trace("uy.");
		if (FlxG.keys.anyPressed( [ESCAPE, BACKSPACE] ) )
			{
				FlxG.switchState(new TitleState());
				//trace("🏳‍🌈If this doesn't trace, its gay🏳‍🌈.");
			}
		if (FlxG.keys.anyPressed( [O, P] ) )
			{
				FlxG.switchState(new OptionsState());
				//trace("🏳‍⚧If this doesn't trace, its trans🏳‍⚧.");
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
			
	healthBar.value = health;
	scoreTxt.text = "Tracked:" + scoreValue + "\n" + mem + "/" + memPeak + "MB";


		for (i in 0...mainKeys.length) {
			keyCheck(i);
		}
	}



	
}
