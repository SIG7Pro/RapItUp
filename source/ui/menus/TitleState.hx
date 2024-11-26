package ui.menus;

import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import Date;

class TitleState extends FlxState {
	static final TITLE_DIRECTORY = 'UI/Title Screen';
	var aprilFools:Bool = false;
	var titleMessage:String = "Rap-It-Up\nPrototype\n\n\n\n\nWork In Progress.";

	var month:Bool = false;

	override function create() {

		trace(FlxG.random.bool(95));

		var purple = new FlxSprite(Paths.image('$TITLE_DIRECTORY/Purple'));
		purple.scale.y = MathUtil.percent(61.33);
		purple.updateHitbox();
		purple.y = -138;
		add(purple);

		var blue = new FlxSprite(Paths.image('$TITLE_DIRECTORY/Blue'));
		blue.scale.y = MathUtil.percent(19.31);
		blue.updateHitbox();
		blue.y = 360;
		add(blue);

		var white = new FlxSprite(Paths.image('$TITLE_DIRECTORY/White'));
		white.scale.y = MathUtil.percent(30.14);
		white.updateHitbox();
		white.y = 499;
		add(white);

		if (Date.now().getMonth() != 3 && Date.now().getDate() != 0){ // Adds main focus content if it isn't April Fools Day.
			var mainFocus = new FlxSprite(Paths.image('$TITLE_DIRECTORY/Fellas'));
			mainFocus.x = 359;
			add(mainFocus);


			// Date based extras below.
				if (Date.now().getMonth() == 1 && Date.now().getDate() == 11) { // Feb 12th
				titleMessage == ("Sad Pre-Valentine's Day!\n\nRap-It-Up\nPrototype\n\n\nWork In Progress.");
				purple.color = 0x8b9aff; // Unmentionable colors..
				blue.color = 0x8bc7ff;
				}
				if (Date.now().getMonth() == 1 && Date.now().getDate() == 13){ // Feb 14th - Valentine's Day
				titleMessage == ("Happy Valentine's Day!\n\nRap-It-Up\nPrototype\n\n\nWork In Progress.");
				purple.color = 0x822c85; // Valentine's Day colors.
				blue.color = 0x3f339a;
				}
				if (Date.now().getMonth() == 6 && Date.now().getDate() == 19){ // July 20th - :)
				titleMessage == ("What a great day to be alive!\n\nRap-It-Up\nPrototype\n\n\nWork In Progress.");
				blue.color = 0x8bc7ff;
				purple.color = 0xffef78;
				}
				if (Date.now().getMonth() == 11 && Date.now().getDate() == 23){ // Dec 24th - Christmas Eve
				titleMessage == ("Merry Christmas! Make sure you're\non the nice list!\nRap-It-Up\nPrototype\n\n\nWork In Progress.");
				}
				if (Date.now().getMonth() == 11 && Date.now().getDate() == 24){ // Dec 25th - Christmas Day
				titleMessage == ("Merry Christmas!!\n\nRap-It-Up\nPrototype\n\n\nWork In Progress.");
				purple.color = 0x2c8562; // Northern lights colors.
				blue.color = 0x33579a;
				}
				if ((Date.now().getMonth() == 11 && Date.now().getDate() == 30) || (Date.now().getMonth() == 0 && Date.now().getDay() == 0)){
				// Jan 1st & Dec 31st - New Year's & New Year's Eve respectively.
				titleMessage == ("Happy New Year!!\n\nRap-It-Up\nPrototype\n\n\nWork In Progress.");
				}
				if (Date.now().getMonth() == 0 && Date.now().getDate() == 5){ // Jan 6th - Three Kings Day
				titleMessage == ("Happy Three Kings Day!\n\nRap-It-Up\nPrototype\n\n\nWork In Progress.");
				}
				// Note: getDate is the day of the month yet getDay is the day of the week. I don't know why it's like this.
				if (Date.now().getMonth() == 10 && Date.now().getDate() == 4){ // Last Thurs of Nov - Thanksgiving
				titleMessage == ("Happy Thanksgiving!\n\nRap-It-Up\nPrototype\n\n\nWork In Progress.");
				}
			// Note: titleMessage is already configured at the start of the script, so these would not effect if not on these dates.
			var titleText = new FlxText("" + titleMessage);
			titleText.setFormat(Paths.font('vcr.ttf'), 22, CENTER);
			titleText.screenCenter(X);
			add(titleText);
		}else{
			titleMessage = 'It appears both Salem and Cadence have gone off to pull some pranks.\nOh dear.';
			var aprilText = new FlxText(titleMessage);
			aprilText.setFormat(Paths.font('vcr.ttf'), 22, CENTER);
			aprilText.screenCenter();
			add(aprilText);
		}




		var playButton = new FlxButton('Start Game', click.bind('start'));
		playButton.setPosition(FlxG.width / 3 - 50 - playButton.width, FlxG.height - playButton.height - 70);
		playButton.scale.x = MathUtil.percent(250.0);
		playButton.updateHitbox();
		add(playButton);

		#if sys
		var exitButton = new FlxButton('Exit Game', click.bind('exit'));
		exitButton.setPosition((FlxG.width / 3 * 2) + 10 - exitButton.width, playButton.y);
		add(exitButton);
		exitButton.scale.x = MathUtil.percent(250.0);
		exitButton.updateHitbox();
		#end

		super.create();

		FlxG.camera.fade(1 / 3, true);
	}

	function click(label:String) {
		switch(label.toLowerCase()) {
			case 'start': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(MainMenuState.new));
			#if sys
			case 'exit':{
				trace("Bye bye!");
				lime.system.System.exit(0);
			}
			#end
		}
	}

	/*override function update(elapsed:Float){
	
		if (FlxG.keys.anyPressed( [ESCAPE, BACKSPACE] ) )
			{
				Sys.exit(0);
				trace("Exiting.");
			}
	}*/
}
