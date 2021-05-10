package flow.escalation;

import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class IsMoveOrTermTicket extends Descision 
{
	/*override public function create():Void
	{
		this._nextYesProcesses = [ new LessThanFifteenDaysUntilSwitchDate()];
		this._nextNoProcesses = [ new IsOrderTicket()];
		super.create();
	}*/
	override public function onYesClick():Void
	{
		this._nexts = [{step: LessThanFifteenDaysUntilSwitchDate, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsOrderTicket, params: []}];
		super.onNoClick();
	}
}