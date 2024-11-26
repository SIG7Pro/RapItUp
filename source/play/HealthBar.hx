package play;

import flixel.FlxG;
import flixel.FlxSprite;
import haxe.io.Path;
import flixel.FlxState;

import flixel.util.FlxColor;
import flixel.ui.FlxBar; // Health Bar Stuff
import flixel.group.FlxGroup;
import flixel.text.FlxText;

class HealthBar extends FlxState { // Temporarily an FlxState, will make a group whenever I find out how to get good at using it, though I may experiment with it here.

	var healthBar:FlxBar;
	var health:Float = 50;
	var scoreTxt:FlxText;
	var scoreValue:Int = 0;
	var hpBarOverlay:FlxSprite;

	var isUpscroll:Bool = true;

	var curRanking:String = "N/A";
	var canBeHit:Bool = false;

	override function create() {
        trace("HealthBar.hx initiated.");

		super.create();

		healthBar = new FlxBar(397 - 1, 625 - 1, RIGHT_TO_LEFT, 593 + 1, 13 + 1, null, "health", 0, 100, false);
		healthBar.createFilledBar(0xFFff1064, 0xFF0cffb6, false);
		healthBar.value = health;

		scoreTxt = new FlxText(27.08, FlxG.height - 40, 0, 'Score: Unidentified');
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

	}
}
