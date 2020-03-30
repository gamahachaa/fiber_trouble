package flow.escalation;

import process.Action;

/**
 * ...
 * @author ...
 */
class _EmailTLtech extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Email PEDRO";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextProcesses = [new _InformUpmostPrio()];
		super.create();
	}
	
}