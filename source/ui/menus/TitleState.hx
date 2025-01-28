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
	var titleMessage:String = "Rap-It-Up\nPrototype\n\nWork In Progress.";
	var titleDefault:String = "Rap-It-Up\nPrototype\n\nWork In Progress.";

	var month:Int;
	var day:Int;
	var date:String; // month/day, doesn't include the year

	override function create() {

		trace(FlxG.random.bool(95));

		month = Date.now().getMonth() + 1;
		day = Date.now().getDate();
		date = '$month/$day';
		trace(date);

		var titleText = new FlxText("" + titleMessage);
		titleText.setFormat(Paths.font('vcr.ttf'), 22, CENTER);
		titleText.screenCenter(X);
		titleText.y = 70;

		// Date based extras below.
				if (date == "4/12") { // Feb 12th
					titleMessage = ("Sad Pre-Valentine's Day!\n\nRap-It-Up Prototype\nWork In Progress.");
				}
				if (month == 1 && day == 28){ // Feb 14th - Valentine's Day
					titleMessage = ("Happy Valentine's Day!\n\nRap-It-Up Prototype\nWork In Progress.");
				}
				if (month == 7 && day == 20){ // July 20th - :)
					titleMessage = ("What a great day to be alive!\n\nRap-It-Up Prototype\nWork In Progress.");
				}
				if (date == "12/24"){ // Dec 24th - Christmas Eve
					titleMessage = ("Merry Christmas! Make sure you're\non the nice list!\nRap-It-Up Prototype\nWork In Progress.");
				}
				if (date == "12/25"){ // Dec 25th - Christmas Day
					titleMessage = ("Merry Christmas!!\n\nRap-It-Up Pro-ho-hototype\nWork In Progress.");
				}
				if ((date == "12/31") || (date == "1/1")){
				// Jan 1st & Dec 31st - New Year's & New Year's Eve respectively.
					titleMessage = ("Happy New Year!!\n\nRap-It-Up Prototype\nWork In Progress.");
				}
				if (date == "1/26"){ // Jan 6th - Three Kings Day
					titleMessage = ("Happy Three Kings Day!\n\nRap-It-Up Prototype\nWork In Progress.");
				}
				// Note: getDate is the day of the month yet getDay is the day of the week. I don't know why it's like this.
				if (month == 11 && Date.now().getDay() == 4){ // Last Thurs of Nov - Thanksgiving
					titleMessage = ("Happy Thanksgiving!\n\nRap-It-Up Prototype\nWork In Progress.");
				}
				if (date == "4/1"){ // April Fool's.
					titleMessage = '\n\n\n\n\n\n\nIt appears both Salem and Cadence have gone off to pull some pranks.\nOh dear.';
				}
		// Note: titleMessage is already configured at the start of the script, so these would have no impact if not on the dates.
		add(titleText);

		var backgroundPurp = new FlxSprite(Paths.image('$TITLE_DIRECTORY/Purple'));
		backgroundPurp.scale.y = MathUtil.percent(61.33);
		backgroundPurp.updateHitbox();
		backgroundPurp.y = -138;
		add(backgroundPurp);

		var backgroundBleu = new FlxSprite(Paths.image('$TITLE_DIRECTORY/Blue'));
		backgroundBleu.scale.y = MathUtil.percent(19.31);
		backgroundBleu.updateHitbox();
		backgroundBleu.y = 360;
		add(backgroundBleu);

		var white = new FlxSprite(Paths.image('$TITLE_DIRECTORY/White'));
		white.scale.y = MathUtil.percent(30.14);
		white.updateHitbox();
		white.y = 499;
		add(white);

		var mainFocus = new FlxSprite(Paths.image('$TITLE_DIRECTORY/Fellas'));
		mainFocus.x = 359;
		if (date == "4/1"){
			mainFocus.alpha = 0.01;
		}
		add(mainFocus);

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
				trace("Farewell!");
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
