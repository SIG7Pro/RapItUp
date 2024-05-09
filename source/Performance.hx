package;
import haxe.Timer;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.display.Shape;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.geom.Rectangle;
import openfl.events.Event;
import openfl.system.System;
import openfl.text.TextField;
import openfl.text.Font;
import openfl.text.TextFormat;
import openfl.Assets;
import openfl.Lib;
import lime.app.Application; // To get the app data from Projet.xml.

/**
 * Performance.hx
 * Haxe/OpenFL class to display memory usage.
 *
 * More informations here
 * https://github.com/yupswing/plik/tree/master/com/akifox/plik/debug
 *
 * @author Simone Cingano (yupswing) PLIK Studio
 * @licence MIT
 *
 * Based on this post written by Kirill Poletaev
 * http://haxecoder.com/post.php?id=24
 */

class Performance extends Sprite
{

    private var performanceText:TextField;
    private var appText:TextField;

    private var fpsHistory:Array<Int>;
    private static inline var fpsHistoryLen:Int=30;
    private var skipped = 0;
    private var skip = 10;
	private var times:Array<Float>;

	private var padding:Int = 10;
	private var paddingY:Int = 3;

	public var graphBarTickness = 3;
	public var graphBarPadding = 1;
	private var barHeight = 30;

	private var memPeak:Float = 0;

    private var bound:Bitmap;
    private var graph:Shape;
    private var boundData:BitmapData;
    private var logo:Bitmap;

    private var fullHeight:Int = 50;

	private var showGraph:Bool;

	public function new(font:Font,
						logoData:BitmapData=null,
						showAppText:Bool=false,
						showGraph:Bool=false) 
	{
		super();

		this.showGraph = showGraph;

		x = 0;
		y = 0;

		// Setup arrays
		fpsHistory = [];
		for (i in 0...fpsHistoryLen) fpsHistory.push(0);
		times = [];

		/// ###################################

		/// ### PERFORMANCE TEXT
    	performanceText = new TextField();
    	performanceText.y = paddingY;
    	performanceText.width = 500;
		performanceText.selectable = false;
		performanceText.defaultTextFormat = new TextFormat(font.fontName, 14, 0xededed);
		performanceText.text = "FPS: 0\nRamery (RAM MEM): 0 MB\nMemory Peak: 0 MB";
		performanceText.embedFonts = true;

		fullHeight = Std.int(performanceText.textHeight + paddingY*3);
		barHeight = Std.int(performanceText.textHeight)-paddingY;

		/// ###################################

		var nextX:Float = padding;

		/// ### LOGO
		var logoSize = 50;
		if (logoData!=null) {
			logo = new Bitmap(logoData);
			logo.smoothing = true;
			logo.x = nextX;
			logo.y = (fullHeight-logoSize)/2;
			nextX = logo.x + logoSize + padding;
		}

		#if !flash #if !html5 #if !next
		/// ### APP TEXT
		if (showAppText) {
	    	appText = new TextField();
	    	appText.x = nextX;
	    	appText.y = paddingY;
	    	appText.width = 500;
			appText.selectable = true; // I like selectable text. ^w^
			appText.defaultTextFormat = new TextFormat(font.fontName, 14, 0xededed);
			//appText.text = "Title:" + Application.current.meta.get('version') + "\nVERSION " + Application.current.meta.get('version'), + "\n" + Application.current.meta.get('company');
			//appText.text = "Testing.";
			appText.text = "Title:" + Application.current.meta.get('title') + "\n" + "Version:" + Application.current.meta.get('version');
			appText.embedFonts = true;
			nextX = appText.x+appText.textWidth+padding;
		}
		#end #end #end

		/// ### GRAPH
		if (showGraph) {
			graph = new Shape();
			graph.x = nextX;
			graph.y = paddingY*2;
			nextX = graph.x + (graphBarTickness+graphBarPadding)*(fpsHistoryLen-2) + graphBarTickness + padding;
		}

		/// ### PERFORMANCE TEXT
    	performanceText.x = nextX;

		/// ###################################

		bound = new Bitmap();
		onResize(null);
		addChild(bound);
		if (logoData!=null) addChild(logo);
		#if !flash #if !html5 #if !next
		if (showAppText) addChild(appText);
		#end #end #end
		if (showGraph) addChild(graph);
		addChild(performanceText);
		
		/// ###################################

		Lib.current.stage.addEventListener(Event.ENTER_FRAME, onEnter);
		Lib.current.stage.addEventListener(Event.RESIZE, onResize);
	}

	private function onEnter(_):Void
	{	
		var now = Timer.stamp();
		times.push(now);
		
		while (times[0] < now - 1)
			times.shift();

        if (skipped == skip) {
            skipped = 0;
            var mem:Float = Math.round(System.totalMemory / 1024 / 1024 * 100)/100;
            if (mem > memPeak) memPeak = mem;
            
            if (visible)
            {	
            	var fps:Int = times.length;
            	if (showGraph) drawGraph(fps);
                performanceText.text = "FPS: " + fps + "\nMEM: " + mem + " MB\nMPK: " + memPeak + " MB";	
            }
        }
        skipped++;
	}

	private function drawGraph(fps:Int):Void 
	{
		var color:Int;
		fpsHistory.push(fps);
        fpsHistory.shift();
        graph.graphics.clear();
        for (i in 0...fpsHistoryLen){
        	graph.graphics.moveTo(graphBarTickness*i+i*graphBarPadding,barHeight);
        	if (fpsHistory[i] > 55) color = 0x9fe198;
        	else if (fpsHistory[i] > 40) color = 0xefdea2;
        	else if (fpsHistory[i] > 30) color = 0xefbda2;
        	else color = 0xeda0a4;
        	graph.graphics.lineStyle(graphBarTickness, color, 0.5);
        	//graph.graphics.lineTo(graphBarTickness*i+i*graphBarPadding,barHeight-barHeight*fpsHistory[i]/60);
			graph.graphics.lineTo(100,barHeight-barHeight*fpsHistory[i]/60);
        }
	}

	private function onResize(_):Void
	{
		// Black rectangle that covers the top part of the screen.
		boundData = new BitmapData(Lib.current.stage.stageWidth,fullHeight);
		boundData.fillRect(new Rectangle(0,0,Lib.current.stage.stageWidth / 1,fullHeight),0x00000000);
		bound.bitmapData = boundData;
		// (Refering to line #198.)
		// Color previously 0x88000000 (transparent black), changed to 0x8800A0AC (transparent teal) for testing so its easier to see since all the backdrops
		// are black, as of writing this and then switched to being fully transparent.
		// Basically if you divide the width by any amount, a white rectangle gets created from what I assume is the difference.
		// So setting it to be at "0%" opacity is close to removing the original black rectangle and preventing the white one from
		// spawning.
	}
	
}
