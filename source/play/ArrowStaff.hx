package play;

// Built off of BetaInfs.hx, in which it basically is a very stripped down BetaNum.hx.
import flixel.FlxSprite;
import flixel.util.FlxColor;

class ArrowStaff extends FlxSprite {
    /*Note: the numbers lack minus signs, but most people won't really need those anyway.*/

    public var id:Int;

    public var insertedX:Float;
	public var insertedY:Float;
	public var sizeX:Int;
	public var sizeY:Int;
	public var noteAirVelocity:Float;

	public var insertedColor:FlxColor;

	//var StatIcons:FlxSprite;

     public function new(id:Int, insertedX:Float, insertedY:Float, sizeX:Int, sizeY:Int, insertedColor:FlxColor, noteAirVelocity:Float) {
            super();

            x = insertedX;
            y = insertedY;

            makeGraphic(sizeX, sizeY, insertedColor);

            velocity.y = noteAirVelocity;

            //makeGraphic(154, 157, 0xff87a3ad);
            updateHitbox();

    }
}
