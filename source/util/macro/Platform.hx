package util.macro;

class Platform {
	static final MSG_UNTESTED = 'You are compiling for an untested OS/platform. Proceed with caution!';
	static final MSG_TESTED   = 'Welcome!';
	
	public static macro function checkForTested():Array<haxe.macro.Expr.Field> {
		#if (bsd || neko || js || ios || android || html5 || blackberry || mac) // Note to self: I accidentally wiped my PC a while back and can't run macOS, hence why its temporarily here.
		haxe.macro.Compiler.define('untested');
		Sys.println(MSG_UNTESTED);
		#else
		haxe.macro.Compiler.define('tested');
		Sys.println(MSG_TESTED);
			#if NO_COMPILE_WATERMARK
				Sys.println("Compile watermark disabled.");
			#else
				Sys.println(sys.io.File.getContent('RAPITUP.txt'));
			#end

		#end

		return haxe.macro.Context.getBuildFields();
	}
}