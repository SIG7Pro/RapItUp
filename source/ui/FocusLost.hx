package ui;

import openfl.display.DisplayObject;
import openfl.display.Graphics;
import openfl.display.Sprite;
import flixel.FlxG;
import flixel.system.FlxAssets;
import flixel.system.ui.FlxFocusLostScreen;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;

import openfl.text.TextField;
import openfl.text.TextFormat;
import flixel.util.FlxColor;

class FocusLost extends FlxFocusLostScreen
{
	@:keep

	// https://youtu.be/l5EezdNNUpA

	override public function new()
	{
		super();
		draw();
		trace("Please work");

		var logo:Sprite = new Sprite();
		FlxAssets.drawLogo(logo.graphics);
		logo.scaleX = logo.scaleY = 0.2;
		logo.x = logo.y = 5;
		logo.alpha = 1;
		addChild(logo);

		visible = false;


		var focLosText = new TextField();
		focLosText.text = "Focus Lost";
		focLosText.textColor = 0xFFdaebf9;
		//focLosText.autoSize = TextFieldAutoSize.CENTER;
		//focLosText.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFFb423d7, 6);
		//focLosText.screenCenter();
		focLosText.x = FlxG.width / 2;
		focLosText.y = FlxG.height / 2;
		focLosText.defaultTextFormat = new TextFormat('Orbitron, Light', 64);
		addChild(focLosText);
		// https://books.openfl.org/openfl-developers-guide/using-the-textfield-class/displaying-text.html
		// Lots of help!
	}

	/**
	 * Redraws the big arrow on the focus lost screen.
	 */
	override public function draw():Void
	{
		var gfx:Graphics = graphics;

		var screenWidth:Int = Std.int(FlxG.stage.stageWidth);
		var screenHeight:Int = Std.int(FlxG.stage.stageHeight);

		// Draw transparent black backdrop
		gfx.clear();
		gfx.moveTo(0, 0);
		gfx.beginFill(0, 0.5);
		gfx.drawRect(0, 0, screenWidth, screenHeight);
		gfx.endFill();

		// Draw white arrow
		var halfWidth:Int = Std.int(screenWidth / 2);
		var halfHeight:Int = Std.int(screenHeight / 2);
		var helper:Int = Std.int(Math.min(halfWidth, halfHeight) / 3);
		gfx.moveTo(halfWidth - helper, halfHeight - helper);
		gfx.beginFill(0xff00ff, 0.65);
		gfx.lineTo(halfWidth + helper, halfHeight);
		gfx.lineTo(halfWidth - helper, halfHeight + helper);
		gfx.lineTo(halfWidth - helper, halfHeight - helper);
		gfx.endFill();

		this.x = -FlxG.scaleMode.offset.x;
		this.y = -FlxG.scaleMode.offset.y;

		/*var focLosText = new FlxText();
		focLosText.text = "Focus Lost";
		focLosText.color = 0xFFdaebf9;
		focLosText.size = 64;
		focLosText.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFFb423d7, 6);
		focLosText.screenCenter();
		add(focLosText);*/

	}
}
