package util;

import lime.system.System;
import sys.FileSystem;

class GameOSCheck {
	public static var OSVers:String = ("Unknown");

	// Doesn't work.

	/*#if linux
	trace("Test");

	bodhiDetection();
	#else
		OSVers = lime.system.System.platformName + " " + lime.system.System.platformVersion;
	#end

	trace('You are running ' + OSVers + '.');


	function bodhiDetection() {
		if (FileSystem.exists('/usr/share/bodhi/quickstart/images/cc.png'))
			OSVers = "Bodhi Linux on "+ lime.system.System.platformName + " " + lime.system.System.platformVersion + ")";
	}*/


}
