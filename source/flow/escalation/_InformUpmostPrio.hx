package flow.escalation;

import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _InformUpmostPrio extends Action 
{

	//override public function create():Void
	//{
		//this._nextProcesses = [ new IsMifiNeeded()];
		//super.create();
	//}
	override public function onClick():Void
	{
		this._nexts = [{step: IsMifiNeeded, params: []}];
		super.onClick();
	}
}