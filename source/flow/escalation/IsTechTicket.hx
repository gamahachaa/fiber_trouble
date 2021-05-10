package flow.escalation;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class IsTechTicket extends Descision 
{
	/*
	override public function create():Void
	{
		this._nextYesProcesses = [ new _EmailTLtech()];
		this._nextNoProcesses = [ new IsMoveOrTermTicket()];
		super.create(); 
	}
	*/
	override public function onYesClick():Void
	{
		this._nexts = [{step: _EmailTLtech, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsMoveOrTermTicket, params: []}];
		super.onNoClick();
	}
}