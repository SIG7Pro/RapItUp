import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import haxe.io.Path;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;

class PlayState extends FlxState 
{
	static inline var placeholderLocation = 'assets/images/Placeholder/';
	var translineArrows:FlxTypedGroup<FlxSprite>;	
	var mainKeys:Array<Array<FlxKey>> = [[A, LEFT], [S, DOWN], [W, UP], [D, RIGHT]];
	var isUpscroll:Bool = true;
	
	override function create() {

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
	}

	public function makeStrumline()
	{
		for (i in 0...2) {
			for (j in 0...4) {
				var babyArrow:FlxSprite = new FlxSprite(50 + (120 * j) + (FlxG.width / 1.875) * i, isUpscroll ? 50 : FlxG.height - 150).makeGraphic(112, 112, 0xFF666666);
				babyArrow.alpha = 0.5;
				translineArrows.add(babyArrow);
			}
		}
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

			for (i in 0...mainKeys.length) {
				keyCheck(i);
			}
	}
}
