package ui.menus;

import flixel.ui.FlxButton;

import flixel.text.FlxText;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSubState;

// Menu Items
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;
// (png + xml)

import String;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

import Math;

// Note: Menu actions are triggered on function Click

class MenuItem extends FlxSubState {

	var sprite:FlxSprite;
	public var daText:FlxText;
	//public var areaPosition:Int = 3;
	public var expectedX:Int = 308;
	public var expectedY:Int = 317;

	// https://haxe.org/manual/expression-for.html
	// Play, Options, Extras, Info, and Exit.
	var menuPlay:FlxSprite;
	var menuOptions:FlxSprite;
	var menuExtras:FlxSprite;
	var menuInfo:FlxSprite;
	var menuExit:FlxSprite;

	var selectAbles:Array<String> = ["Play", "Options", "Extras", "Info", "Exit"];
	// Shoutouts to https://github.com/Ralsin/FNF-MintEngine/blob/1c681b35e081c1b297f47ed06815503f6ed7089a/source/funkin/menus/MainMenu.hx#L13 which helped me realize :Array<Spring> was.
	var currentlySelected:Int = 3;


	override function create() {

	/*var b2aseBG = new FlxSprite();
	b2aseBG.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
	b2aseBG.alpha = 0.75;
	add(b2aseBG); // baseBG stays still!*/

		trace("Substate MenuItem.hx is active!");

		/*

		There's likely better ways to make a menu like this, however this is my first true main menu done on my own without any code for the basis or whatever. (However reference code was used.)

		 Position and Opacity Info

		top - 158, 27, 50%
		halftop - 248, 167, 75%
		selected - center - 308, 317, 100%
		halfbottom - 248, 467, 75%
		bottom - 148, 617, 50% (tho may switch to 158 X)
		*/

		var createdEntries:Int = 0;
		for (createdEntries in selectAbles) {
			//trace(createdEntries + " Entry");
			var menuItem:Int = 1; // The value of the current item. Play = 1, Exit = 5.
			var menuTitle:String = createdEntries; // The title of the entries created, Play, Options, etc.
			var menulowercase:String = menuTitle.toLowerCase(); // The entry's title in lowercase.

				var menuPrefix:String = "UI/Main Menu/Selectables/menu"; // The directory to the main menu graphics.
				var animationData = FlxAtlasFrames.fromSparrow(Paths.image(menuPrefix + createdEntries + ".png"), Paths.image(menuPrefix + createdEntries +".xml")); // Applied info to animation data.

			/*
			menuPlay:FlxSprite; 3
			var menuOptions:FlxSprite; 4
			var menuExtras:FlxSprite; 5
			var menuInfo:FlxSprite; 1
			var menuExit; 2
	`		*/

			switch createdEntries{
			// To do: Make X and Y values go to the values in the selectX and Y strings. Though maybe done so in the create loop and onUpdate.
			// I'm thinking that maybe in the future if someone returns to the menu from say the options menu, then the options selection would stay selected until they move to a diff area, hence putting it into the create function too. Though I'm not sure on how this would work though. -E.A.
				case "Play":{
					menuPlay = new FlxSprite();
					menuPlay.frames = animationData;
					menuPlay.animation.addByPrefix('itemFocus', menulowercase + 'Selected');
 					menuPlay.animation.addByPrefix('itemDeselect', menulowercase + 'Unselected');
					menuPlay.x = 308;
					menuPlay.y = 317;
					//FlxTween.tween(sprite, {x: 308, y: 317}, 1, {type: FlxTweenType.PERSIST, ease: FlxEase.quadInOut});
					add(menuPlay);
				}
				case "Options":{
					menuOptions = new FlxSprite();
					menuOptions.frames = animationData;
					menuOptions.animation.addByPrefix('itemFocus', menulowercase + 'Selected'); // https://github.com/FunkinCrew/Funkin/blob/a380fa16e5ad521fde48fce10073be771f9ab347/source/Girlfriend.hx#L13 Reference.
					// Value 1 is the animation name and Value 2 is what's determined in the predefined prefix (xml.)
					// itemFocus will have optionsSelected as the animation stuff if that makes sense.
					//menuOptions.animation.add(, [0]);
					menuOptions.animation.addByPrefix('itemDeselect', menulowercase + 'Unselected');
					menuOptions.x = 248;
					menuOptions.y = 467;
					add(menuOptions);
				}
				case "Extras":{
					menuExtras = new FlxSprite();
					menuExtras.frames = animationData;
					menuExtras.animation.addByPrefix('itemFocus', menulowercase + 'Selected');
					menuExtras.animation.addByPrefix('itemDeselect', menulowercase + 'Unselected');
					menuExtras.x = 148;
					menuExtras.y = 617;
					add(menuExtras);
				}
				case "Info":{
					menuInfo = new FlxSprite();
					menuInfo.frames = animationData;
					menuInfo.animation.addByPrefix('itemFocus', menulowercase + 'Selected');
					menuInfo.animation.addByPrefix('itemDeselect', menulowercase + 'Unselected');
					menuInfo.x = 158;
					menuInfo.y = 27;
					add(menuInfo);
				}
				case "Exit":{
					menuExit = new FlxSprite();
					menuExit.frames = animationData;
					menuExit.animation.addByPrefix('itemFocus', menulowercase + 'Selected');
					menuExit.animation.addByPrefix('itemDeselect', menulowercase + 'Unselected');
					menuExit.x = 248;
					menuExit.y = 167;
					add(menuExit);
				}
			}
			createdEntries += 1;
		}


		//FlxTween.tween(sprite, {x: expectedX, y: expectedY}, 1, {type: FlxTweenType.PERSIST, ease: FlxEase.quadInOut});

		#if DEBUG_TEXT
		var button = new FlxButton(0, 0, "Click me", onButtonClicked);
		button.screenCenter();
		add(button);

		daText = new FlxText();
		daText.text = "Hello, World!";
		daText.color = FlxColor.CYAN;
		daText.size = 32;
		daText.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLUE, 4);
		daText.screenCenter();
		add(daText);
		#end



	}

	#if DEBUG_TEXT
	function onButtonClicked()
	{
		FlxG.camera.flash(FlxColor.WHITE, 0.33);
		//sprite.y = Math.cos(sprite.y/1.1)*90;
		//sprite.x = Math.cos(sprite.x/1.1)*90;
		/*
		var str = string.split('');
		str.push(str.unshift());
		string = str.join('');


		var str = string.split('');
		str.push(str.unshift());
		string = str.join('');*/

	}#end

	override function update(elapsed:Float){
		super.update(elapsed);

		#if DEBUG_TEXT
		daText.text = "SelectedA:" + currentlySelected;
		// https://haxe.org/manual/expression-switch.html
		#end


		if (FlxG.keys.anyPressed([UP, DOWN, W, S]))
		{
				travelTo(); // Triggers a function which sees either if UP/W or DOWN/S has been pressed and works accordingly.
		}
		if (FlxG.keys.anyPressed([ENTER, SPACE]))
		{
				click(currentlySelected + "");
				trace(currentlySelected + "");
		}

			// Original opacity gradient. 1 -> .75 -> .5
			// Altered opacity gradient. 1 -> .75 -> .5 -> .45 -> 4
			// Potential final gradient. 1 -> .75 -> .5 -> .375 -> .25
			// https://midpointfinder.com/
				if (currentlySelected == 5) {
					// Info
				if (FlxG.keys.anyPressed([ENTER, SPACE])){
								click('5');
					}

					menuInfo.alpha = 1;
					menuExit.alpha = 0.75;
					menuPlay.alpha = 0.5;
					menuOptions.alpha = 0.375;
					menuExtras.alpha = 0.250;

					menuInfo.animation.play('itemFocus');
					menuExit.animation.play('itemDeselect');
					menuPlay.animation.play('itemDeselect');
					menuOptions.animation.play('itemDeselect');
					menuExtras.animation.play('itemDeselect');

					}
				if (currentlySelected == 4) {
					// Exit
					if (FlxG.keys.anyPressed([ENTER, SPACE]))
						{
								click('4');
						}

					menuInfo.alpha = 0.75;
					menuExit.alpha = 1.00;
					menuPlay.alpha = 0.75;
					menuOptions.alpha = 0.50;
					menuExtras.alpha = 0.375;

					menuInfo.animation.play('itemDeselect');
					menuExit.animation.play('itemFocus');
					menuPlay.animation.play('itemDeselect');
					menuOptions.animation.play('itemDeselect');
					menuExtras.animation.play('itemDeselect');

					}
				if (currentlySelected == 3) {
					//Play // Default

					if (FlxG.keys.anyPressed([ENTER, SPACE]))
						{
								click('3');
						}

					menuInfo.alpha = 0.50;
					menuExit.alpha = 0.75;
					menuPlay.alpha = 1.00;

					menuOptions.alpha = 0.75;
					menuExtras.alpha = 0.50;

					menuExit.animation.play('itemDeselect');
					menuInfo.animation.play('itemDeselect');
					menuPlay.animation.play('itemFocus'); // Reference: https://github.com/FunkinCrew/Funkin/blob/a380fa16e5ad521fde48fce10073be771f9ab347/source/PlayState.hx#L405
					menuOptions.animation.play('itemDeselect');
					menuExtras.animation.play('itemDeselect');

					}
				if (currentlySelected == 2) {
					// Options

					if (FlxG.keys.anyPressed([ENTER, SPACE]))
						{
								click('2');
						}

					menuInfo.alpha = 0.375;
					menuExit.alpha = 0.50;
					menuPlay.alpha = 0.75;
					menuOptions.alpha = 1;
					menuExtras.alpha = 0.75;

                    menuInfo.animation.play('itemDeselect');
					menuExit.animation.play('itemDeselect');
					menuPlay.animation.play('itemDeselect');
					menuOptions.animation.play('itemFocus');
					menuExtras.animation.play('itemDeselect');

					}
				if (currentlySelected == 1) {
					// Extras

					if (FlxG.keys.anyPressed([ENTER, SPACE]))
						{
								click('1');
						}

					menuInfo.alpha = 0.25;
					menuExit.alpha = 0.375;
					menuPlay.alpha = 0.50;
					menuOptions.alpha = 0.75;
					menuExtras.alpha = 1;

                    menuInfo.animation.play('itemDeselect');
					menuExit.animation.play('itemDeselect');
					menuPlay.animation.play('itemDeselect');
					menuOptions.animation.play('itemDeselect');
					menuExtras.animation.play('itemFocus');

					}
	}


	function travelTo(){

		if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W)
			{
					currentlySelected += 1;
			}
		if (FlxG.keys.justPressed.DOWN || FlxG.keys.justPressed.S)
			{
					currentlySelected -= 1;
			}
		if (currentlySelected > selectAbles.length)
			currentlySelected = 1;
		if (currentlySelected < 1)
			currentlySelected = selectAbles.length;
	}

	function click(label:String) { //Taken from TitleState, lol.
		trace("function click is functioning.");
		switch(label.toLowerCase()) {
			//case 'prestar': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(MainMenuState.new));

			// Note, selections are granted opposite of how they appear on screen.
			// So for instance:
			/*
				Info is 5
				Exit is 4
				Play is 3
				Options is 2
				Extras is 1
			*/
			// You may wonder why it's like this, well, it's the fact that this menu isn't made well and is my first "functional" menu. Haxe is hard, man. The API makes it 25% easier though, however I wish there was more examples.

			case '3': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(play.PlayState.new));
			case '2':{
					// Options
					FlxG.camera.fade(1 / 3, FlxG.switchState.bind(OptionsState.new));
				}
			case '1':{
					// Extras.
					trace("Extras aren't implemented yet,sorry.");
				}
			case '5':{
			// Info
			FlxG.camera.shake();
			trace("Extra info isn't added yet. Sorry.");
			}  //
			case '4': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(TitleState.new));
		}
	}


}
