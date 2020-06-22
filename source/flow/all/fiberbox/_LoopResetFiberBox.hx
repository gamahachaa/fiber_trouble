package flow.all.fiberbox;

import process.ActionLoop;
import process.DescisionLoop;
import process.Process;

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