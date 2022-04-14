package flow.all.fiberbox;

import flow.vti._RXfromVTI;
import tstool.process.Action;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _AdvicePutOpenSpace extends Action 
{
	var _next:ProcessContructor;
    public function new(next:ProcessContructor){
		super();
		_next = next;
	}
	override public function onClick():Void
	{
		//this._nexts = [{step: _RXfromVTI, params: []}];
		if (_next == null) _next =  Main.HISTORY.getPreviousClass();
		this._nexts = [_next];
		super.onClick();
	}
}