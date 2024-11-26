package play;

class Conductor {
	// Special thanks FNF forum in Haxe server! https://discord.com/channels/162395145352904705/1202383067373637642/1303089477975150602
	var oldStep:Int = step;
	var oldBeat:Int = beat;
	var oldMeasure:Int = measure; // sections = measure

	time += elapsed * 1000;
	// if the difference is bigger than or equal to 25 ms resync
	if (Math.abs(time - inst.time) >= 25) time = inst.time;

	var curBeat:Int = bpmChange.beat + Math.floor((time - bpmChange.time) / crotchet);
	var curStep:Int = Math.floor(curBeat * 4);
	var curMeasure:Int = Math.floor(curBeat * 0.25);

	if (oldStep != curStep) onStepHit();
	if (oldBeat != curBeat) onBeatHit();
	if (oldMeasure != curMeasure) onMeasureHit();
	//


}
