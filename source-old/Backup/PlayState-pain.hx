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
     //var Arrows:FlxSprite;
     var scaleDir:Int = 1;
     
     var playArrowLeft:FlxSprite;
     var playArrowDown:FlxSprite;
     var playArrowUp:FlxSprite;
     var playArrowRight:FlxSprite;


	override public function create()
	{
		super.create();
		
		var placeholderBG:String = placeholderLocation + "Placeholder.png";
		
		placeholderGraphic = new FlxSprite();
		plcGrRed = new FlxSprite();	
		placeholderGraphic.loadGraphic(placeholderBG);
		placeholderGraphic.screenCenter();
		placeholderGraphic.alpha = 0.5;		
		plcGrRed.loadGraphic(placeholderBG);
		plcGrRed.screenCenter();
		plcGrRed.alpha = 0.25;
		plcGrRed.y += 15;
		plcGrRed.color = FlxColor.RED;
		
		add(placeholderGraphic);
		add(plcGrRed);
		
		FlxTween.tween(plcGrRed, {y: plcGrRed.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG});
		FlxTween.tween(placeholderGraphic, {y: plcGrRed.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG, startDelay: 0.1});
		
		
		var tex = FlxAtlasFrames.fromSparrow(placeholderLocation + "FNFArrows.png", placeholderLocation + "FNFArrows.xml");
		//Arrows.frames = tex;
		// Reference for above: https://github.com/FunkinCrew/Funkin/blob/567a7af392085da91ba8382e8117b2bcd9d03e7f/source/Boyfriend.hx#L17
		
		//for (playerArrows in [playArrowLeft, playArrowDown, playArrowUp, playArrowRight]){
		//playerArrows.frames = tex;
		//}
		
		/*playArrowLeft.frames = FlxAtlasFrames.fromSparrow(placeholderLocation + "FNFArrows.png", placeholderLocation + "FNFArrows.xml");
		playArrowDown.frames = FlxAtlasFrames.fromSparrow(placeholderLocation + "FNFArrows.png", placeholderLocation + "FNFArrows.xml");
		playArrowUp.frames = FlxAtlasFrames.fromSparrow(placeholderLocation + "FNFArrows.png", placeholderLocation + "FNFArrows.xml");
		playArrowRight.frames = FlxAtlasFrames.fromSparrow(placeholderLocation + "FNFArrows.png", placeholderLocation + "FNFArrows.xml");	
		*/
		playArrowLeft.animation.addByPrefix('purpleScroll', 'purple instance');
		playArrowLeft.animation.addByPrefix('purplehold', 'purple hold piece');
		playArrowLeft.animation.addByPrefix('purpleholdend', 'pruple end hold');
		
		playArrowDown.animation.addByPrefix('blueScroll', 'blue instance');
		playArrowDown.animation.addByPrefix('bluehold', 'blue hold piece'); 
		playArrowDown.animation.addByPrefix('blueholdend', 'blue hold end'); 

		playArrowUp.animation.addByPrefix('greenScroll', 'green instance');
		playArrowUp.animation.addByPrefix('greenhold', 'green hold piece');
		playArrowUp.animation.addByPrefix('greenholdend', 'green hold end');
		
		playArrowRight.animation.addByPrefix('redScroll', 'red instance');
		playArrowRight.animation.addByPrefix('redhold', 'red hold piece');
		playArrowRight.animation.addByPrefix('redholdend', 'red hold end');
		
		//for (playerArrows in [playArrowLeft, playArrowDown, playArrowUp, playArrowRight]) 
		//add(playerArrows);
		
		playArrowLeft.scale.x = 0.7;
		playArrowDown.scale.x = 0.7;
		playArrowUp.scale.x = 0.7;
		playArrowRight.scale.x = 0.7;
		playArrowLeft.scale.y = 0.7;
		playArrowDown.scale.y = 0.7;
		playArrowUp.scale.y = 0.7;
		playArrowRight.scale.y = 0.7;
		
		add(playArrowLeft);
		playArrowLeft.animation.play('purpleScroll');
		
		add(playArrowDown);
		playArrowDown.animation.play('blueScroll');
		
		add(playArrowUp);
		playArrowUp.animation.play('greenScroll');
		
		add(playArrowRight);
		playArrowRight.animation.play('redScroll');

		//Arrows.updateHitbox();
		
		//Arrows.playAnim('greenScroll');
		//Arrows.scale = 0.7;

		//add(Arrows);
		
		
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
