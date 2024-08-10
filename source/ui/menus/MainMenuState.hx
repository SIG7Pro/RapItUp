package ui.menus;

/*


TEMPORARY MAIN MENU
THIS WILL BE REDONE
IT WILL LOOK A LOT BETTER
PROCEED WITH CAUTION


*/
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

// I could imagine the menu being as such:
/*
Things with more spaces are subcategories. So if you'd click play, the menu would change and show said options.
Imagine kinda like DOOM/SRB2. Though, I'd make a menu system more like that when options are in the game
so I could make a "low-quality" mode and then have the title screen/menu intertwined like that.
All will have a return option.

- Play
  - Story Mode
  - Freeplay
- Extras
  - Achivements
  - Gallery
  - Account (Possibly one day.)
  - Mods
- Options
  - General
  - Gameplay
  - Optimization
  - Customization
  - Misc
  (Seperate menu for Options stuff.)

Concept main menu:
0ld. https://media.discordapp.net/attachments/1225972775609569360/1237084089857609788/image.jpg?ex=66b25456&is=66b102d6&hm=7a814898280563c6016bd14354601755b8a293ebd74164d7879aea15ab20f496 (OLDEST, WAY BEFORE THIS STATE WAS WRITTEN)
1st. https://media.discordapp.net/attachments/1225972775609569360/1268483143061606452/image.png?ex=66b2853c&is=66b133bc&hm=674263a50460bb1f5890d1cb8a1aec8560b48ba0933cc8c001fa533a5c15b5b8
2nd https://media.discordapp.net/attachments/1225972775609569360/1269858010902298716/Picture_2024-08-04_23-03-53.png?ex=66b23fae&is=66b0ee2e&hm=e28c5883a6090e13bf0f3efc62948c0254420b58282833fd7206091646181f23


*/

class MainMenuState extends FlxState {
	final MENU_DIRECTORY = 'assets/images/Placeholder/MainMenu';
	var blankLabel:String = " ";

	var imageTraversal:FlxSprite;
	var backerTrav:FlxSprite;

	override function create() {

		var baseBG = new FlxSprite();
		baseBG.makeGraphic(FlxG.width, FlxG.height, 0xff249fb4);
		baseBG.screenCenter();
		add(baseBG);

		var bgBorders = new FlxSprite();
		bgBorders.loadGraphic(MENU_DIRECTORY + "/menuBorders.png");
		bgBorders.screenCenter();
		add(bgBorders);

		// All buttons at 50% size.
		/*
		X + Y positions
		1. 0, 216
		2. 130, 346
		3. 270, 476
		4. 400, 606
		
		Since as of now, only three buttons exist (Play, Options, and Return), the last position won't be used.

		*/

		var playButton = new FlxButton(blankLabel, click.bind('play'));
		playButton.setPosition(0, 216);
		playButton.loadGraphic('$MENU_DIRECTORY/buttonPlay.png', true, 534, 228);
		playButton.scale.set(0.5, 0.5); 
		playButton.updateHitbox();
		playButton.animation.add('DISABLED', [1]);
		playButton.animation.add('HIGHLIGHT', [0]);
		playButton.animation.add('NORMAL', [1]);
		playButton.animation.add('PRESSED', [0]);
		add(playButton);

		var optButton = new FlxButton(blankLabel, click.bind('options'));
		optButton.setPosition(130, 346);
		optButton.loadGraphic('$MENU_DIRECTORY/buttonOpts.png', true, 534, 228);
		optButton.scale.set(0.5, 0.5); 
		optButton.updateHitbox();
		optButton.animation.add('DISABLED', [1]);
		optButton.animation.add('HIGHLIGHT', [0]);
		optButton.animation.add('NORMAL', [1]);
		optButton.animation.add('PRESSED', [0]);
		add(optButton);

		var exitButton = new FlxButton(blankLabel, click.bind('exit'));
		exitButton.setPosition(270, 476);
		exitButton.loadGraphic('$MENU_DIRECTORY/buttonReturn.png', true, 534, 228);
		exitButton.scale.set(0.5, 0.5); 
		exitButton.updateHitbox();
		exitButton.animation.add('DISABLED', [1]);
		exitButton.animation.add('HIGHLIGHT', [0]);
		exitButton.animation.add('NORMAL', [1]);
		exitButton.animation.add('PRESSED', [0]);
		add(exitButton);

		var xzxzxzxz = new FlxButton(blankLabel, click.bind('mooste'));
		xzxzxzxz.setPosition(400, 606);
		xzxzxzxz.loadGraphic('$MENU_DIRECTORY/buttonTemplate.png', true, 534, 228);
		xzxzxzxz.scale.set(0.5, 0.5); 
		xzxzxzxz.updateHitbox();
		xzxzxzxz.animation.add('DISABLED', [1]);
		xzxzxzxz.animation.add('HIGHLIGHT', [0]);
		xzxzxzxz.animation.add('NORMAL', [1]);
		xzxzxzxz.animation.add('PRESSED', [0]);
		add(xzxzxzxz);

		super.create();

		FlxG.camera.fade(1 / 3, true);
	}

	function click(label:String) {
		switch(label.toLowerCase()) {
			case 'play': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(play.PlayState.new));
			//case 'options': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(OptionsState.new));
			case 'mooste': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(MoveState.new));
			#if sys
			case 'exit': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(TitleState.new));
			#end
		}
	}

}