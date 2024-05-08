package;

import flixel.FlxState;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import Arrow;

class PlayState extends FlxState
{
     var placeholderLocation:String = "assets/images/Placeholder/";

     var placeholderGraphic:FlxSprite;
     var plcGrRed:FlxSprite;
     var Arrows:FlxSprite;
     var ExtraW:FlxSprite;
     var scaleDir:Int = 1;

	override public function create()
	{
		super.create();
		
		/*
		gfDance.frames = Paths.getSparrowAtlas('ShadowBump');
				gfDance.animation.addByPrefix('danceLeft', 'Shadow Title Bump', 24);
		gfDance.animation.addByIndices('danceLeft', 'River Title Bump', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		
		Reference code that I'll be *possibly* borrowing so I can remember how to add animations from Sparrow Atlases.
		
		*/
		
		placeholderGraphic = new FlxSprite();
		placeholderGraphic.loadGraphic(placeholderLocation + "Placeholder.png");
		placeholderGraphic.screenCenter();
		placeholderGraphic.alpha = 0.5;
		add(placeholderGraphic);
		
		plcGrRed = new FlxSprite();
		plcGrRed.loadGraphic(placeholderLocation + "Placeholder.png");
		plcGrRed.screenCenter();
		plcGrRed.y += 15;
		plcGrRed.alpha = 0.25;
		plcGrRed.color = FlxColor.RED;
		add(plcGrRed);
		
		FlxTween.tween(plcGrRed, {y: plcGrRed.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG});
		FlxTween.tween(placeholderGraphic, {y: plcGrRed.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG, startDelay: 0.1});
		
		Arrows = new FlxSprite();
		var tex = FlxAtlasFrames.fromSparrow(placeholderLocation + "FNFArrows.png", placeholderLocation + "FNFArrows.xml");
		Arrows.frames = tex;
		// Reference for above: https://github.com/FunkinCrew/Funkin/blob/567a7af392085da91ba8382e8117b2bcd9d03e7f/source/Boyfriend.hx#L17

		Arrows.animation.addByPrefix('greenScroll', 'green instance');
		Arrows.animation.addByPrefix('redScroll', 'red instance');
		Arrows.animation.addByPrefix('blueScroll', 'blue instance');
		Arrows.animation.addByPrefix('purpleScroll', 'purple instance');

		Arrows.animation.addByPrefix('purpleholdend', 'pruple end hold');
		Arrows.animation.addByPrefix('greenholdend', 'green hold end');
		Arrows.animation.addByPrefix('redholdend', 'red hold end');
		Arrows.animation.addByPrefix('blueholdend', 'blue hold end');

		Arrows.animation.addByPrefix('purplehold', 'purple hold piece');
		Arrows.animation.addByPrefix('greenhold', 'green hold piece');
		Arrows.animation.addByPrefix('redhold', 'red hold piece');
		Arrows.animation.addByPrefix('bluehold', 'blue hold piece');

		Arrows.updateHitbox();
		//Arrows.antialiasing = true;
		Arrows.playAnim('greenScroll');
		Arrows.scale = 0.7;
		Arrows = new Arrow(true, false);
		Arrows.frames = FlxAtlasFrames.fromSparrow(placeholderLocation + "FNFArrows.png", placeholderLocation + "FNFArrows.xml");
		Arrow.x = 15;
		add(Arrows);
		
		ExtraW = new Arrow(false, true);
		ExtraW.frames = FlxAtlasFrames.fromSparrow(placeholderLocation + "FNFArrows.png", placeholderLocation + "FNFArrows.xml");
		ExtraW.x = 40;
		add(ExtraW);
		
		
		
	}

	override public function update(elapsed:Float)
	{
		/*placeholderGraphic.scale.x += elapsed * 5 * scaleDir * 0.10;
		placeholderGraphic.scale.y -= elapsed * 5 * scaleDir * 0.10;

		if (placeholderGraphic.scale.x >= 4
			|| placeholderGraphic.scale.x <= 0.5
			|| placeholderGraphic.scale.y >= 4
			|| placeholderGraphic.scale.y <= 0.5)
			scaleDir *= -1;*/

		super.update(elapsed);	
		
		// https://github.com/FunkinCrew/Funkin/blob/cf7b871c56dfafa68d961a452ab50aa1a0fb13a0/source/TitleState.hx#L153
		// X.
		
		
	}
}
