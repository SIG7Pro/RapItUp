import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import haxe.io.Path;
import flixel.FlxState;

class PlayState extends FlxState {
	static inline var placeholderLocation = 'assets/images/Placeholder/';
	
	var playArrows = new FlxTypedGroup<FlxSprite>();

	override function create() {
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

		for (i in 0...1) {
			var playArrow = new FlxSprite().makeGraphic(154, 157, 0xff87a3ad);
			playArrow.setGraphicSize(playArrow.width * 0.7);
			playArrow.x = FlxG.width - 15 - (3 * (100 + 30));
			playArrows.add(playArrow);
		}
		add(playArrows);

		super.create();
	}
}