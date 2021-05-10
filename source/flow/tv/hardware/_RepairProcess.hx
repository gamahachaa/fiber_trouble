package flow.tv.hardware;

import flow.End;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _RepairProcess extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: End, params: []}];
		super.onClick();
	}
}