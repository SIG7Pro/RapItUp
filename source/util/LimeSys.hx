package util;

import haxe.Constraints;
import lime._internal.backend.native.NativeCFFI;
import lime.app.Application;
import lime.graphics.RenderContextAttributes;
import lime.math.Rectangle;
import lime.ui.WindowAttributes;
import lime.utils.ArrayBuffer;
import lime.utils.UInt8Array;
import lime.utils.UInt16Array;
#if flash
import flash.net.URLRequest;
import flash.system.Capabilities;
import flash.Lib;
#end
#if air
import flash.desktop.NativeApplication;
#end
#if ((js && html5) || electron)
import js.html.Element;
import js.Browser;
#end
#if sys
import sys.io.Process;
#end
// mac fixes? / wait no the fix was me renaming stuff i forgot to rename
import lime.system.System;

/**

	Note: This is a copy of Lime's lime.system.System file! (Albeit stripped down to a few functions.)

	Only used so Performance.hx doesn't give the following error:
	source/ui/Performance.hx:134: characters 21-32 : Class<lime.system.System> has no field totalMemory

	My thoughts:

	// Acts as a shortcut for some Lime functions.
	// Mainly for use in Performance.hx
	// Reason why is since OpenFL's System file was what the original file used, however I suppose importing Lime's system file causes it to get confused and do:
	// source/ui/Performance.hx:134: characters 21-32 : Class<lime.system.System> has no field totalMemory
	// Lime 8.2.1 is the reference.

	- Me, earlier version of file.

	Also note I tried importing as and it didn't seem to work.



**/
#if !lime_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@:access(lime._internal.backend.native.NativeCFFI)
@:access(lime.system.Display)
@:access(lime.system.DisplayMode)
#if (cpp && windows && !lime_disable_gpu_hint)
@:cppFileCode('
#if defined(HX_WINDOWS) && !defined(__MINGW32__)
extern "C" {
	_declspec(dllexport) unsigned long NvOptimusEnablement = 0x00000001;
	_declspec(dllexport) int AmdPowerXpressRequestHighPerformance = 1;
}
#endif
')
#end
class LimeSys
{


	public static var platformLabel(get, never):String;
	public static var platformName(get, never):String;
	public static var platformVersion(get, never):String;

	@:noCompletion private static var __platformLabel:String;
	@:noCompletion private static var __platformName:String;
	@:noCompletion private static var __platformVersion:String;

	@:noCompletion private static function __runProcess(command:String, args:Array<String> = null):String
	{
		#if sys
		try
		{
			if (args == null) args = [];

			var process = new Process(command, args);
			var value = StringTools.trim(process.stdout.readLine().toString());
			process.close();
			return value;
		}
		catch (e:Dynamic) {}
		#end
		return null;
	}


	private static function get_platformLabel():String
	{
		if (__platformLabel == null)
		{
			#if (lime_cffi && !macro && windows && !html5)
			var label:String = CFFI.stringValue(NativeCFFI.lime_system_get_platform_label());
			if (label != null) __platformLabel = StringTools.trim(label);
			#elseif linux
			__platformLabel = __runProcess("lsb_release", ["-ds"]);
			#else
			var name = LimeSys.platformName;
			var version = LimeSys.platformVersion;
			if (name != null && version != null) __platformLabel = name + " " + version;
			else if (name != null) __platformLabel = name;
			#end
		}

		return __platformLabel;
	}

	private static function get_platformName():String
	{
		if (__platformName == null)
		{
			#if windows
			__platformName = "Windows";
			#elseif mac
			__platformName = "macOS";
			#elseif linux
			__platformName = __runProcess("lsb_release", ["-is"]);
			#elseif ios
			__platformName = "iOS";
			#elseif android
			__platformName = "Android";
			#elseif air
			__platformName = "AIR";
			#elseif flash
			__platformName = "Flash Player";
			#elseif tvos
			__platformName = "tvOS";
			#elseif tizen
			__platformName = "Tizen";
			#elseif blackberry
			__platformName = "BlackBerry";
			#elseif firefox
			__platformName = "Firefox";
			#elseif webos
			__platformName = "webOS";
			#elseif nodejs
			__platformName = "Node.js";
			#elseif js
			__platformName = "HTML5";
			#end
		}

		return __platformName;
	}

	private static function get_platformVersion():String
	{
		if (__platformVersion == null)
		{
			#if (lime_cffi && !macro && windows && !html5)
			__platformVersion = CFFI.stringValue(NativeCFFI.lime_system_get_platform_version());
			#elseif android
			var release = JNI.createStaticField("android/os/Build$VERSION", "RELEASE", "Ljava/lang/String;").get();
			var api = JNI.createStaticField("android/os/Build$VERSION", "SDK_INT", "I").get();
			if (release != null && api != null) __platformVersion = release + " (API " + api + ")";
			#elseif (lime_cffi && !macro && (ios || tvos))
			__platformVersion = NativeCFFI.lime_system_get_platform_version();
			#elseif mac
			__platformVersion = __runProcess("sw_vers", ["-productVersion"]);
			#elseif linux
			__platformVersion = __runProcess("lsb_release", ["-rs"]);
			#elseif flash
			__platformVersion = Capabilities.version;
			#end
		}

		return __platformVersion;
	}


}

