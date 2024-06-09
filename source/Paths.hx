import flixel.util.typeLimit.OneOfTwo;
import openfl.Assets;
import haxe.io.Path;
import haxe.ds.ReadOnlyArray;

typedef ExtensionArray = OneOfTwo<Array<String>, ReadOnlyArray<String>>;

class Paths {
	public static final ROOT_DIRECTORY = 'assets';

	public static final IMAGE_EXTENSIONS:ReadOnlyArray<String> = [
		'png',
		'jpg', 'jpeg'
	];
	public static final AUDIO_EXTENSIONS:ReadOnlyArray<String> = [
		#if web
		'mp3'
		#else
		'ogg',
		'wav'
		#end
	];
	public static final FONT_EXTENSIONS:ReadOnlyArray<String> = [
		'ttf',
		'otf'
	];

	public static function searchWithExtensions(path:String, extensions:ExtensionArray):String {
		for (ext in (cast extensions : Array<String>)) {
			var extPath = '$path.$ext';
			if (Assets.exists(extPath)) return extPath;
		}
		return path;
	}

	/**
	 * Returns path to file in `images` folder
	 * You don't have to specify the extension in `key`
	 * @param key 
	 * @return String
	 */
	public static function image(key:String):String {
		return searchWithExtensions('$ROOT_DIRECTORY/images/$key', IMAGE_EXTENSIONS);
	}

	/**
	 * Returns path to file in `sounds` folder
	 * You don't have to specify the extension in `key`
	 * @param key 
	 * @return String
	 */
	public static function sound(key:String):String {
		return searchWithExtensions('$ROOT_DIRECTORY/sounds/$key', AUDIO_EXTENSIONS);
	}

	/**
	 * Returns path to file in `music` folder
	 * You don't have to specify the extension in `key`
	 * @param key 
	 * @return String
	 */
	public static function music(key:String):String {
		return searchWithExtensions('$ROOT_DIRECTORY/music/$key', AUDIO_EXTENSIONS);
	}

	/**
	 * Returns path to file in `data` folder
	 * You MUST specify the extension in `key`
	 * @param key 
	 * @return String
	 */
	public static function data(key:String):String {
		return '$ROOT_DIRECTORY/data/$key';
	}

	public static function font(key:String):String {
		for (ext in FONT_EXTENSIONS) {
			var path = '$ROOT_DIRECTORY/fonts/$key.$ext';
			if (Assets.exists(path)) return path;
		}
		return '$ROOT_DIRECTORY/fonts/$key';
	}
}