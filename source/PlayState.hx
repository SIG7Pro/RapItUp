import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import haxe.io.Path;
import flixel.FlxState;

import flixel.ui.FlxBar; // Health Bar Stuff
import flixel.ui.FlxButton; // Health Bar Testing
import flixel.text.FlxText;


class PlayState extends FlxState {
	static inline var placeholderLocation = 'assets/images/Placeholder/';
	
	var playArrows = new FlxTypedGroup<FlxSprite>();
	var hitArrows = new FlxSprite();

	var healthBar:FlxBar;
	var health:Float = 50;
	
	var scoreTxt:FlxText;

	override function create() {

		trace("PlayState.hx initiated.");
		var placeholderBG = Path.join([placeholderLocation, 'Placeholder 2.png']);

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

		for (i in 0...1) {
			var playArrow = new FlxSprite().makeGraphic(154, 157, 0xff87a3ad);
			playArrow.setGraphicSize(playArrow.width * 0.7);
			playArrow.x = FlxG.width - 15 - (3 * (100 + 30));
			playArrows.add(playArrow);
		}
		add(playArrows);


		hitArrows = new FlxSprite();
		hitArrows.makeGraphic(154, 157, 0xffc24b99);
		hitArrows.scale.x = 0.7;
		hitArrows.scale.y = 0.7;
		hitArrows.x = FlxG.width - 15 - (3 * (100 + 30));
		hitArrows.y = FlxG.height + 2;
		add(hitArrows); // EXPERIMENTAL

		FlxTween.tween(hitArrows, {y: 0 - (FlxG.height + 5)}, 2.0);
		// Last value seems to be the speed. Originally 1.4. The closer to 0, the faster it gets.
		// Setting the last value to 0.5 makes it really fast! 1.4 is a moderate speed, 2.0 is pretty good.
		// 157 = Strum height.

		super.create();
		
		
		
		//healthBar = new FlxUIBar(0, 0, LEFT_TO_RIGHT, 400, 15, "40", health, 0, 100, true);
		healthBar = new FlxBar(FlxG.width / 2, FlxG.height - 80, RIGHT_TO_LEFT, 400, 15, null, "health", 0, 100, true);
		healthBar.createFilledBar(0xFFff1064, 0xFF0cffb6, true);
		healthBar.value = health;	
		
		scoreTxt = new FlxText(20, FlxG.height - 40, 0, 'Wahoo.');
		scoreTxt.setFormat("assets/fonts/captura-now-regular.otf", 22, LEFT);
		scoreTxt.screenCenter(X);
		
		add(healthBar);
		add(scoreTxt);

		
		
	}


	override function update(elapsed:Float){
	   //trace("uy.");
		if (FlxG.keys.anyPressed( [ESCAPE, BACKSPACE] ) )
			{
				FlxG.switchState(new TitleState());
				trace("🏳‍🌈If this doesn't trace, its gay🏳‍🌈.");
			}
		if (FlxG.keys.anyPressed( [O, P] ) )
			{
				FlxG.switchState(new OptionsState());
				trace("🏳‍⚧If this doesn't trace, its trans🏳‍⚧.");
			}
		#if debug
		if (FlxG.keys.anyPressed([W, UP]) )
			{
				health += 10;
				//trace("🏳‍⚧Isdf.");
			}
		if (FlxG.keys.anyPressed([S, DOWN]) )
			{
				health -= 10;
				//trace("🏳‍🌈Isdf.");
			}
		#end
			
	healthBar.value = health;
	scoreTxt.text = "HP:" + health;

	}



	
}
