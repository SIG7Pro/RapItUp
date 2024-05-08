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
		
		
		//var tex = FlxAtlasFrames.fromSparrow(placeholderLocation + "FNFArrows.png", placeholderLocation + "FNFArrows.xml");
		//Arrows.frames = tex;
		// Reference for above: https://github.com/FunkinCrew/Funkin/blob/567a7af392085da91ba8382e8117b2bcd9d03e7f/source/Boyfriend.hx#L17
		

		//for (playerArrows in [playArrowLeft, playArrowDown, playArrowUp, playArrowRight]) 
		//add(playerArrows);
		playArrowLeft = new FlxSprite();
		playArrowLeft.makeGraphic(154, 157, 0xFF87a3ad); // https://api.haxeflixel.com/flixel/util/FlxColor.html
		playArrowLeft.scale.x = 0.7; // In FNF, the arrows are roughly 150x160 in size. (Ex: The grey right arrow is 154x157.) Ingame, it gets scaled to 70%.
		playArrowLeft.scale.y = 0.7; // Considering its a good size to use, I may also use its method. The right arrow would become 108x110.
		
		playArrowLeft.x = FlxG.width - 15 - (3 * (100 + 30));
		
		add(playArrowLeft);
		//FNF Arrow Colors:
		/*
		87a3ad - Strumline Arrows (All)
		
		c24b99 - Left
		ffffff, ffeeff, ffd8ff - Left (Glow, lightest to darkest.)
		7e6ab5, 7e6ab5 - Left (Dark, lightest to darkest.)
		
		00ffff - Down
		8bffff, 89ffff, 88ffff - Down (Glow)
		6dc0c7, 51b5bd - Down (Dark)
		
		(I'll track the other colors later. 4/24/24)
		
		12fa05 - Up
		
		f9393f - Right
		*/

		
		
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
