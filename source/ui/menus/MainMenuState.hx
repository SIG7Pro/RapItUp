package ui.menus;

/*

MAIN MENU
ITS STILL IN PROGRESS
ALTHOUGHT IT LOOKS A LOT BETTER
PROCEED WITH CAUTION

*/
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

import sys.io.File;
import sys.FileSystem;

/*

Inspiration: https://discord.com/channels/922849922175340586/922854812792541234/1273578285405831220 / https://media.discordapp.net/attachments/922854812792541234/1273578285472681996/FANMADE_IT_WONT_BE_IN_THE_MOD.png?ex=66efe735&is=66ee95b5&hm=4cd7a49951bb45e794fc1ef7b61cd519ce5e378859d23a9caab1b7ce064d6ffc&=&format=webp&quality=lossless&width=843&height=474 (Psych Engine Discord)

Concept main menu:
1st version: (Precoloring)
   https://media.discordapp.net/attachments/1225972775609569360/1274212962524987463/image.png?ex=66ef934b&is=66ee41cb&hm=9cd415ddc77ebadf0bd6015016ac65d38d395b18fa84b7fc165aa17815cda214
2nd version: (Colored)
   https://media.discordapp.net/attachments/1225972775609569360/1274870175342137425/MainMenuReimagineWIP2.png?ex=66effd1f&is=66eeab9f&hm=4d0228295888e74f44a8f3ea34a08fc83cfc2db2c4f60988c0420633910e0dab
3rd and mostly final version:
   https://media.discordapp.net/attachments/1225972775609569360/1283922674434969714/image.png?ex=66eff66b&is=66eea4eb&hm=cb3f6e06b06009964f093c955de4c00ffc33d13fb49654db28f27301f95743c8
*/

class MainMenuState extends FlxState {
	final MENU_DIRECTORY = 'assets/images/UI/Main Menu/';
	//var blankLabel:String = " ";

	//var imageTraversal:FlxSprite;
	//var backerTrav:FlxSprite;

	var pinkBG:FlxSprite;
	var leftPurpGradient:FlxSprite;
	var sideGradients:FlxSprite;
	var chekUrz:FlxSprite;
	var glassFloor:FlxSprite; // This is gonna be tricky.
	var sideVinyl:FlxSprite;
	var menuSelector:FlxSprite; // Replace when ya know how to put multiples.
	//var userPicture:FlxSprite; // Incase ideas come into tuition.
		//var userShadow:FlxSprite; // I don't know how to do smooth drop-shadows for sprites and not text.
	var selectionBanner:FlxSprite;
	var menuLabel:FlxSprite;
	var userShadow:FlxSprite;
	var userPicture:FlxSprite;

	var curVersion:FlxText;
	var userInfo:FlxText;
	var userHandle:FlxText;

	override function create() {

		var pinkBG = new FlxSprite();
		//pinkBG.loadGraphic(MENU_DIRECTORY + "leftGradient.png");
		pinkBG.makeGraphic(FlxG.width, FlxG.height, 0xfff9d8ff);
		pinkBG.screenCenter();
		add(pinkBG);

		//var bgBorders = new FlxSprite();
		//bgBorders.loadGraphic(MENU_DIRECTORY + "menuBorders.png");
		//bgBorders.screenCenter();
		//add(bgBorders);

		//trace(sys.io.File.getContent('assets/data/v1Credits.txt')); // How to crash the game. Load a file that doesn't exist.

		/*
			Note to self for blendMode/shaders:
			https://api.openfl.org/openfl/display/BlendMode.html
			https://github.com/jamieowen/glsl-blend/blob/master/screen.glsl
			https://github.com/Kn1ghtNight/Haxeflixel-shadertoy-tutorial
		*/
		/*
		X + Y positions
		
		front elements:
			menuLabel: 702, 0, no y value since its at the top of the screen, its also at the far right
			Profile Data:
				text
					aligned left
					- user text 1099,621, color: bf59c1
					- handler 1097 (tho 1099 is more correct), 651 (36 pixels above bottom, 8 left from right edge, color: cc9ad5)
				icon
					- profile picture 994, 610
					- shadow 1004, 620 (10+ x and y the pfp, color: e0cde8)
			version text: 10, 683, 35 size aligned left, 10 pixels above bottom edges of screen, color: bf59c1
		main elements
			banner: 732, 203
			selector: 308, 317 (when selected, also centered at Y when so)
			vinyl: -312, 79, center of Y
		bg elements
			floor:
			  - standard export: y = 480
			  - raw floor: -184, 493 (png) -163, 507 (internal) (screen + 50%)
			checkers: x is 1056 but its at full height so y 0.
			menuGradients: Exported at full size, 0, 0.

		leftGradient: Exported at full height, and always on the left, so 0, 0. (10%)
		background: no offset since its screen sized

		*/


		//BG Elements

		leftPurpGradient = new FlxSprite();
		leftPurpGradient.loadGraphic(MENU_DIRECTORY + "leftGradient.png");
		leftPurpGradient.screenCenter(Y);
		leftPurpGradient.alpha = 0.1;
		add(leftPurpGradient);

		sideGradients = new FlxSprite();
		sideGradients.loadGraphic(MENU_DIRECTORY + "menuGradients.png");
		//sideGradients.screenCenter();
		add(sideGradients);
			
		chekUrz = new FlxSprite();
		chekUrz.loadGraphic(MENU_DIRECTORY + "bgCheckers.png");
		chekUrz.x = 1056;
		add(chekUrz);

		glassFloor = new FlxSprite();
		glassFloor.loadGraphic(MENU_DIRECTORY + "Floor.png"); // Replace with RawFloor when blending works.
		glassFloor.screenCenter();
		//glassFloor.y = 480; // Raw floor.
		add(glassFloor);
			
		// Main Elements


		sideVinyl = new FlxSprite();
		sideVinyl.loadGraphic(MENU_DIRECTORY + "Vinyl.png");
		sideVinyl.screenCenter(Y);
		sideVinyl.x = -312;
		sideVinyl.y = 79;
		add(sideVinyl);

		//menuSelector = new FlxSprite();
		//menuSelector.loadGraphic(MENU_DIRECTORY + "menuBorders.png");
		//menuSelector.screenCenter(Y);
		//menuSelector.x = 308;
		//menuSelector.y = 317;
		//add(menuSelector);

		selectionBanner = new FlxSprite();
		selectionBanner.loadGraphic(MENU_DIRECTORY + "Banners/Play.png");
		//selectionBanner.screenCenter();
		selectionBanner.x = 732;
		selectionBanner.y = 203;
		add(selectionBanner);

		// Front Items

			//curVersion = new FlxText(30, 94, "v" + (FlxG.stage.application.meta.get('version')));
			curVersion = new FlxText(10, 683);
			curVersion.text = "v" + (FlxG.stage.application.meta.get('version'));
			trace("v" + [FlxG.stage.application.meta.get('version')]);
			curVersion.setFormat(Paths.font("monsterrat.ttf"), 35, FlxColor.WHITE, FlxTextAlign.LEFT);	
			curVersion.color = 0xFFbf59c1;
			add(curVersion);

			// Profile information.
					userHandle = new FlxText(1099, 651, "Test Build");
					//#if windows
					//userHandle = new FlxText(1099, 651, "@" + {Sys.environment()["USERNAME"]} );
					//#else
					//userHandle = new FlxText(1099, 651, "@" + {Sys.environment()["USER"]} );
					//#end
					userHandle.setFormat(Paths.font("monsterrat.ttf"), 35);
					userHandle.color = 0xFFcc9ad5;
					add(userHandle);

					userInfo = new FlxText(1099, 621, "User #001");
					userInfo.setFormat(Paths.font("monsterrat.ttf"), 35);
					userInfo.color = 0xFFbf59c1;	
					add(userInfo);

					/*if ( FileSystem.exists('/home/alory/Pictures/Drawings/Rap-It-Up Shenanigans/Random Ideas/Icons/Default (Green).png') ){
						// Profile picture in memory.

						userPicture = new FlxSprite();
						userPicture.loadGraphic(sys.io.File.getContent("/home/alory/Pictures/Drawings/Rap-It-Up Shenanigans/Random Ideas/Icons/Default (Green).png") );
						userPicture.x = 994;
						userPicture.y = 610;
						userPicture.scale.x = 0.2;
						userPicture.scale.y = 0.2;
						userPicture.updateHitbox();
	
						userShadow = new FlxSprite();
						userShadow.loadGraphic(userPicture.graphic);
						userShadow.color = 0xFFe0cde8;
						userShadow.x = userPicture.x + 10;
						userShadow.y = userPicture.y + 10;
						userShadow.updateHitbox();
						//userShadow.scale = (0.2, 0.2);
						userShadow.scale.x = 0.2;
						userShadow.scale.y = 0.2;
						add(userShadow);
						add(userPicture);
	

					}*/
					
		

		menuLabel = new FlxSprite();
		menuLabel.loadGraphic(MENU_DIRECTORY + "menuLabel.png");
		menuLabel.x = 702;
		add(menuLabel);


		/*creditsText = new FlxText(30, 94, sys.io.File.getContent('assets/data/v1Credits.txt'));
		creditsText.setFormat(Paths.font("vcr.ttf"), 17, FlxColor.WHITE, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		creditsText.antialiasing = FlxG.save.data.antialiasing;
		creditsText.borderSize = 1.12;
		add(creditsText);
		Debug.logInfo('Credits Text Initiated.');*/

		super.create();

		FlxG.camera.fade(1 / 3, true);
	}

	/*function click(label:String) {
		switch(label.toLowerCase()) {
			case 'play': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(play.PlayState.new));
			//case 'options': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(OptionsState.new));
			case 'mooste': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(MoveState.new));
			#if sys
			case 'exit': FlxG.camera.fade(1 / 3, FlxG.switchState.bind(TitleState.new));
			#end
		}
	}*/

}