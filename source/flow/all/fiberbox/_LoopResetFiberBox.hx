package flow.all.fiberbox;

import process.ActionLoop;
import process.Process;

/**
 * ...
 * @author ...
 */
class _LoopResetFiberBox extends ActionLoop
{
	//var _next:Process;
	override public function new( ?next:Process )
	{
		super(next);
		//_next = next;
	}
	//override public function create():Void
	//{
		////this._titleTxt = "Faire une remise au réglages d'usine de la Fiber Box";
		////this._detailTxt = "(reset box)";
		////this._illustration = "box/box_reset";
		////this._nextProcesses = [_next == null ? Process.GET_PREVIOUS_INSTANCE() : _next];
//
		////super.create();
	//}

}