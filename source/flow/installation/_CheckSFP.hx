package flow.installation;

import flow.all.fiberbox._LoopResetFiberBox;
import flow.nointernet.fiberbox.BoxLedStatus;
import flow.nointernet.fiberbox._RebootBox;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _CheckSFP extends Action 
{
	override public function onClick():Void
	{
		//this._nexts = [{
			//step: _RebootBox, 
			//params: [
				//{step: BoxLedStatus},
				//{step: BoxLedStatus}
			//]	
		//}];
		this._nexts = [{
			step: _RebootBox, 
			params: [
				{step: _LoopResetFiberBox, params: [{step: BoxLedStatus},{step: BoxLedStatus}]},
				{step: _LoopResetFiberBox, params: [{step: BoxLedStatus},{step: BoxLedStatus}]}
			]	
		}];
		super.onClick();
	}
}