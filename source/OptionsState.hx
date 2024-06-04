import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.ui.FlxButton;

class OptionsState extends FlxState {

	var returnButton:FlxButton;

    override function create() {
    
    	var titleText = new FlxText(20, 0, 0, 'Options\n{This is being worked on, and there is currently no\noptions ready.}');
		titleText.setFormat(22, CENTER);
		titleText.screenCenter(X);
		add(titleText);
    
        returnButton = new FlxButton(0, 0, "Return", clickPlay);
        returnButton.x = (FlxG.width / 2) - 10 - returnButton.width;
        returnButton.y = FlxG.height - returnButton.height - 10;
        add(returnButton); // Placeholder just so I can quit and reload.

    }


	function clickPlay()
	{
		//FlxG.camera.fade(FlxColor.BLACK, 0.33, false, function()
		{
				FlxG.switchState(new TitleState());
		};
	}


        // Options I'll try to add:
        /*
        1. Low Detail Mode - Disables some graphics. 
        and a 
        2. Debug Display

        */

}
