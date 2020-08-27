package flow.equipment;

import flow.End;
import flow._AddMemoVti;
import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _SoOrderLogisticsEquipment extends ActionMail 
{

	public function new() 
	{
		super(SOTickets.FIX_421);
	}
	override public function create():Void
	{
		this._nextProcesses = [new _AddMemoVti()];
		super.create();
	}
	
}