package util.macro;

class Platform {
	static final MSG_UNTESTED = 'You are compiling for an untested OS/platform. Proceed with caution!';
	static final MSG_TESTED   = 'Welcome!';
	
	public static macro function checkForTested():Array<haxe.macro.Expr.Field> {
		#if (bsd || neko || js || ios || android || html5 || blackberry)
		haxe.macro.Compiler.define('untested');
		Sys.println(MSG_UNTESTED);
		#else
		haxe.macro.Compiler.define('tested');
		Sys.println(MSG_TESTED);
		Sys.println(sys.io.File.getContent('RAPITUP.txt'));
		#end

		return haxe.macro.Context.getBuildFields();
	}
}