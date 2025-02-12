package util.macro;

class Platform {
	static final MSG_UNTESTED = 'You are compiling for an untested OS/platform. Proceed with caution!';
	static final MSG_TESTED   = 'Welcome!';
	
	public static macro function checkForTested():Array<haxe.macro.Expr.Field> {
		// System Checking
		#if (bsd || neko || js || ios || android || html5 || blackberry || mac)
			haxe.macro.Compiler.define('untested');
			Sys.println(MSG_UNTESTED);
		#else
			haxe.macro.Compiler.define('tested');
			Sys.println(MSG_TESTED);
		#end
		// Watermark Displaying
			#if NO_COMPILE_WATERMARK
				Sys.println("Compile watermark disabled.");
			#else
				Sys.println(sys.io.File.getContent('RAPITUP.txt'));
			#end
		// Notice about debug text. Doesn't apply to the FPS counter.
			#if DEBUG_TEXT
				Sys.println("Debug text may be shown on some states, please take note of that.");
			#end



		return haxe.macro.Context.getBuildFields();
	}
}
