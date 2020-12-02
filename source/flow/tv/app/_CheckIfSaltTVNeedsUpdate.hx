package flow.tv.app;

import tstool.process.Process;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class _CheckIfSaltTVNeedsUpdate extends Descision 
{

	//override public function create()
	//{
		//
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