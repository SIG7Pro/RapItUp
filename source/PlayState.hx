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
import flixel.input.keyboard.FlxKey;



class PlayState extends FlxState {
	static inline var placeholderLocation = 'assets/images/Placeholder/';

	var healthBar:FlxBar;
	var health:Float = 50;
	
	var scoreTxt:FlxText;

	// lantern engine shiz (hi - ty dot cee ess)
	var translineArrows:FlxTypedGroup<FlxSprite>;	
	var mainKeys:Array<Array<FlxKey>> = [[A, LEFT], [S, DOWN], [W, UP], [D, RIGHT]];
	var isUpscroll:Bool = true;


	override function create() {

		var sprite = new FlxSprite();
		sprite.makeGraphic(FlxG.width, FlxG.height, FlxColor.BROWN);
		sprite.screenCenter();
		add(sprite); // Just so the background behind the placeholder graphics isn't completely black.
		
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

		translineArrows = new FlxTypedGroup<FlxSprite>();
		add(translineArrows);

		makeStrumline();

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


		for (i in 0...mainKeys.length) {
			keyCheck(i);
		}
	}



	
}