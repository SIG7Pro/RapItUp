import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxState;

class TitleState extends FlxState {

var purple:FlxSprite;
var blue:FlxSprite;
var white:FlxSprite;

var linuxPrettyName:String = 'cat /etc/*-release | grep "PRETTY_NAME" | sed ' + "'" + 's/PRETTY_NAME=//g' + "'" + " | sed 's/" + '"//g' + "'";
// cat /etc/*-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=//g' | sed 's/"//g'


	override function create() {
	// In the rare case I need to change/revamp the title screen, take notes from Pop'N Music 6. https://youtu.be/ShmE8wysUWc?t=399 or 7 (8:48) with scrolling BG eleents like 9/Wii Play
	// 11's also looks good.
	var titleDirectory:String = "assets/images/UI/Title Screen/";

	trace(Sys.systemName); // Testing.
	//Sys.command("neofetch");
	#if linux
	trace("You are running");
	Sys.command(linuxPrettyName);
	trace("(" + Sys.systemName + ")");
	#end
		purple = new FlxSprite();
		purple.loadGraphic(titleDirectory + "Purple.png");
		
		purple.scale.y = 0.6133; // 61.33%
		purple.updateHitbox();
		
		purple.y = -138;
		add(purple);

		blue = new FlxSprite();
		blue.loadGraphic(titleDirectory + "Blue.png");	
		 /* blue.scale.y;*/
		blue.scale.y = 0.1931; // 19.31%
		//blue.y = 90/*.516*/
		blue.updateHitbox();
		blue.y = 360;
		add(blue);

		white = new FlxSprite();
		white.loadGraphic(titleDirectory + "White.png");
		white.scale.y = 0.3014; // 30.14%
		 /* white.scale.y;*/
		//white.y = 249/*.6042*/
		white.updateHitbox();
		white.y = 503 - 4;
		add(white);

	
	
	
		var titleText = new FlxText(20, 0, 0, 'Rap-It-Up\nPrototype\n \n \n \n \nWork In Progress.');
		titleText.setFormat("assets/fonts/vcr.ttf", 22, CENTER);
		titleText.screenCenter(X);
		add(titleText);

		var playButton = new FlxButton('Play', click.bind('play'));
		playButton.setPosition((FlxG.width / 2) - 10 - playButton.width, FlxG.height - playButton.height - 70);
		add(playButton);

		var optButton = new FlxButton('Options', click.bind('options'));
		optButton.setPosition((FlxG.width / 2) - 10 - playButton.width, FlxG.height - playButton.height - 40);
		add(optButton);

		#if sys
		var exitButton = new FlxButton((FlxG.width / 2) - 10, 80, 'X', click.bind('exit'));
		exitButton.y = (FlxG.height - playButton.height - 10);
		add(exitButton);
		#end

		super.create();

		FlxG.camera.fade(0.33, true);
	}

	function click(label:String) {
		switch(label.toLowerCase()) {
			case 'play': FlxG.camera.fade(0.3, FlxG.switchState.bind(new PlayState()));
			case 'options': FlxG.camera.fade(0.33, FlxG.switchState.bind(new OptionsState()));
			#if sys
			case 'exit': Sys.exit(0);
			#end
		}
	}
	
	/*override function update(elapsed:Float){
	#if debug
	if (FlxG.debugger.visible = true){
		//if (FlxG.mouse.justPressed){
		   
		//}
		
		if (FlxG.keys.anyPressed( [ENTER] ) )
		{
			trace("Purple Y: " + purple.y + " Blue Y: " + blue.y + " White Y: " + white.y);
			Sys.sleep(20); // If only I knew of https://haxeflixel.com/documentation/debugger/#the-watch-window
		}
	
	} // The debugger ends up always showing on screen which isn't quite good.
	#end
	}

	*/
}
