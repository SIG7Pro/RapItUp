package ui;

import openfl.geom.Rectangle;
import flixel.util.FlxStringUtil;
import openfl.system.System;
import haxe.Timer;
import openfl.events.Event;
import openfl.text.TextFormat;
import openfl.text.Font;
import openfl.display.BitmapData;
import openfl.display.Shape;
import openfl.display.Bitmap;
import openfl.text.TextField;
import openfl.display.Sprite;

import util.LimeSys;
import sys.FileSystem;

class Performance extends Sprite {
	var performanceText:TextField;
	var appText:TextField;

	var fpsHistory:Array<Int> = [for (i in 0...fpsHistoryLength) 0];
	static final fpsHistoryLength = 30;

	// frame skip shit
	var skipped = 0;
	var skip = 10;

	var times:Array<Float> = [];

	// paddings betweeb elements
	var paddingX = 10.0;
	var paddingY = 3.0;

	// graph preference stuff
	public var graphBarThickness = 3;
	public var graphBarPadding = 1;
	var barHeight = 30;

	// visuals
	var bound:Bitmap;
	var graph:Shape;
	var boundData:BitmapData;
	var logo:Bitmap;
	var logoShadow:Bitmap;

	// full height of object
	var fullHeight = 50;

	var showGraph:Bool;

	var osInfoFromMain:Bool = true;
	var osInfoRetriever:String;
	var OSVers:String = (LimeSys.platformName + " " + LimeSys.platformVersion); // Might break for Bodhi users but it doesn't really matter for now.

	var expBuildDisplay:String = " ";

	public function new(font:Font, ?logoData:BitmapData, showAppText = false, showGraph = false) {
		super();

		#if debug
			expBuildDisplay = "Debug Build";
		#else if debug && hl
			expBuildDisplay = "Debug Build (Hashlink.)";
		#end

		this.showGraph = showGraph;

		performanceText = new TextField();
		performanceText.y = paddingY;
		performanceText.width = 500;
		performanceText.selectable = false;
		performanceText.defaultTextFormat = new TextFormat(font.fontName, 14, 0xffededed);
		performanceText.text = 'FPS:  \nRAM:  \nVRAM:';
		performanceText.embedFonts = true;

		fullHeight = Math.ceil(performanceText.textHeight + paddingY * 3);
		barHeight = Math.ceil(performanceText.textHeight - paddingY);

		var nextX = paddingX;

		var logoSize = 50;
		if (logoData != null) {
			logo = new Bitmap(logoData);
			logo.smoothing = true;
			logo.x = nextX;
			logo.y = (fullHeight - logoSize) / 2;
			nextX = logo.x + logoSize + paddingX;

			logoShadow = new Bitmap(logoData + "fancy-1");
			logoShadow.smoothing = logo.smoothing;
			logoShadow.x = logo.x + 2;
			logoShadow.y = logo.y + 2;
			nextX = (logoShadow.x + 2 + logoSize + paddingX + 2) + 2;

		}

		if (showAppText) {
			appText = new TextField();
			appText.x = nextX;
			appText.y = paddingY;
			appText.width = 500;
			appText.selectable = true;
			appText.defaultTextFormat = performanceText.defaultTextFormat;
			//appText.text = 'Title: ${FlxG.stage.application.meta.get('title')}\nVersion: ${FlxG.stage.application.meta.get('version')}';
			appText.text = 'Operating System: ' + OSVers + '\nVersion: ${FlxG.stage.application.meta.get('version')}\n$expBuildDisplay';
			appText.embedFonts = true;
			nextX = appText.x + appText.textWidth + paddingX;
		}

		if (showGraph) {
			graph = new Shape();
			graph.x = nextX;
			graph.y = paddingY * 2;
			nextX = graph.x + (graphBarThickness + graphBarPadding) * (fpsHistoryLength - 2) + graphBarThickness + paddingX;
		}

		performanceText.x = nextX;

		bound = new Bitmap();
		// onResize(null);
		addChild(bound);
		if (logoData != null) addChild(logoShadow);
		if (logoData != null) addChild(logo);
		if (showAppText) addChild(appText);
		if (showGraph) addChild(graph);
		addChild(performanceText);

		FlxG.stage.addEventListener(Event.RESIZE, onResize);
	}

	function osChecker(){
	// Taken from Main.hx.
	OSVers == LimeSys.platformName + " " + LimeSys.platformVersion;
		#if linux
		if ( FileSystem.exists('/usr/share/bodhi/quickstart/images/cc.png') ){
		//Checks for Bodhi Linux. Might get other versions for other Linux Distros *if needed*. If the System name and version say something different than the OS name itself (how Bodhi says Ubuntu since its a deriative but they forgot to update it) then it can go here.
			OSVers == "Bodhi Linux on "+ LimeSys.platformName + " " + LimeSys.platformVersion + ".";
			// Reason this is here instead of the old if/elses is since it'd just overwrite if on Bodhi and do nothing if otherwise. Much better. {Writing this on KDE Neon right now since I bricked my Bodhi install.}
		}
		#end

	}

	override function __enterFrame(deltaTime:Float) {
		var now = Timer.stamp();
		times.push(now);

		while (times[0] < now - 1)
			times.shift();

		if (skipped == skip) {
			skipped = 0;

			var ram = System.totalMemory;
			var vram = FlxG.stage?.context3D?.totalGPUMemory;

			var formattedRam = FlxStringUtil.formatBytes(ram, 2);
			var formattedVram = FlxStringUtil.formatBytes(vram, 2);

			if (visible) {
				var fps = times.length;
				if (showGraph) drawGraph(fps);
				performanceText.text = 'FPS: $fps\nRAM: $formattedRam\nVRAM: $formattedVram';
				appText.text = 'Operating System: ' + OSVers + '\nVersion: ${FlxG.stage.application.meta.get('version')}\n$expBuildDisplay'; // Most important one!
			}
		}
		skipped++;
	}

	function drawGraph(fps:Int) {
		var color:Int;
		fpsHistory.push(fps);
		fpsHistory.shift();
		graph.graphics.clear();
		for (i in 0...fpsHistoryLength) {
			graph.graphics.moveTo(graphBarThickness * i + i * graphBarPadding, barHeight);

			if (fpsHistory[i] > FlxG.updateFramerate * 0.9) color = 0xff9fe198;
			else if (fpsHistory[i] > FlxG.updateFramerate * 0.67) color = 0xffefdea2;
			else if (fpsHistory[i] > FlxG.updateFramerate * 0.5) color = 0xffefbda2;
			else color = 0xffeda0a4;

			graph.graphics.lineStyle(graphBarThickness, color, 0.5);
			graph.graphics.lineTo(100, barHeight - barHeight * fpsHistory[i] / FlxG.updateFramerate);
		}
	}

	function onResize(e:Event) {

		boundData = new BitmapData(FlxG.stage.stageWidth, fullHeight);
		boundData.fillRect(new Rectangle(0, 0, FlxG.stage.stageWidth, fullHeight), 0x00000000);
		bound.bitmapData = boundData;
		appText.text = 'Operating System: ' + OSVers + '\nVersion: ${FlxG.stage.application.meta.get('version')}\n$expBuildDisplay';
	}


}
