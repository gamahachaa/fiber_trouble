package flow.all.fiberbox;

import tstool.process.ActionLoop;
import tstool.process.DescisionLoop;
import tstool.process.Process;

/**
 * ...
 * @author ...
 */
class _LoopResetFiberBox extends DescisionLoop
{
	//var _next:Process;
	override public function new( ?nextYes:Process, ?nextNo:Process)
	{
		super(nextYes,nextNo);
		//_next = next;
	}

}