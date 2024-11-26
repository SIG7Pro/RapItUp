package play;

typedef BPMChange = {
	var beat:Int;
	var time:Float;
	var bpm:Float;
}

// extending flxbasic so we can make it an flxplugin
// after you initialize FlxGame in Main.hx:
// FlxG.plugins.add(new Conductor());

class Conductor extends flixel.FlxBasic {
	public static var bpm(default, set):Float = 120.0;
	public static var crotchet:Float = (60 / bpm) * 1000;
	public static var stepCrotchet:Float = crotchet * 0.25;
	public static var bpmChanges:Array<BPMChange> = [];

	public static var step:Int = 0;
	public static var beat:Int = 0;
	public static var measure:Int = 0;

	// callbacks that you can set
	// Conductor.onStep = function() {}
	public static dynamic function onStep(value:Int) {}
	public static dynamic function onBeat(value:Int) {}
	public static dynamic function onMeasure(value:Int) {}

	public function new() {
		super();
		self = this;
		visible = false;
		reset();
	}

	public static function reset() {
		step = 0;
		beat = 0;
		measure = 0;
		bpmChanges = [];
	}

	override function update(elapsed:Float) {
		var oldStep:Int = step;
		var oldBeat:Int = beat;
		var oldMeasure:Int = measure;

		//syncTime(elapsed);
		//syncVocals();

		var bpmChange:BPMChange = getBPMChangeFromMS(time);
		if (bpmChange.bpm != bpm) bpm = bpmChange.bpm;

		var curBeat:Int = bpmChange.beat + Math.floor((time - bpmChange.time) / crotchet);
		var curStep:Int = Math.floor(curBeat * 4);
		var curMeasure:Int = Math.floor(curBeat * 0.25);

		if (oldStep != curStep) onStep(step = curStep);
		if (oldBeat != curBeat) onBeat(beat = curBeat);
		if (oldMeasure != curMeasure) onMeasure(measure = curMeasure);
	}

	inline public static function calculateCrotchet(bpm:Float) {
		return (60 / bpm) * 1000;
	}

	public static function getBPMChangeFromMS(time:Float):BPMChange {
		var lastChange:BPMChange = {
			beat: 0,
			time: 0,
			bpm: bpm,
		};

		if (bpmChanges.length == 0) return lastChange;

		for (i in 0...bpmChanges.length) {
			final change:BPMChange = bpmChanges[i];
			if (time >= change.time) lastChange = change;
			else break;
		}

		return lastChange;
	}

	/*public static function setBPMChanges(song:Chart) {
		bpmChanges = [];

		var curBPM:Float = song.bpm;
		var curBeats:Int = 0;
		var curTime:Float = 0.0;

		for (_ => section in song.notes) {
			if (section.changeBPM && section.bpm != curBPM) {
				curBPM = section.bpm;
				bpmChanges.push({
					beat: curBeats,
					time: curTime,
					bpm: curBPM,
				});
			}

			curBeats += 4;
			curTime += calculateCrotchet(curBPM);
		}
	}*/

	public static function set_bpm(value:Float):Float {
		crotchet = calculateCrotchet(value);
		stepCrotchet = crotchet * 0.25;

		return bpm = value;
	}
}