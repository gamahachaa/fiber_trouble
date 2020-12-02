package flow.tv.app;

//import tstool.process.Action;

import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _CheckIfAppleTVNeedsUpdate extends Descision 
{

	//override public function create()
	//{
		//var n:Array<Process> = [new ProblemSolved()];
		//this._nextYesProcesses = n;
		//this._nextNoProcesses = n;
		//super.create();
	//}
	override public function onYesClick():Void
	{
		this._nexts = [{step: ProblemSolved, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: ProblemSolved, params: []}];
		super.onNoClick();
	}
}