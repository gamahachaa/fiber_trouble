package flow.equipment;

import flow._AddMemoVti;
import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _SoPluginUseInfo extends ActionMail 
{

	
	public function new() 
	{
		super(SOTickets.FIX_412);
	}
	override public function create():Void
	{
		this._nextProcesses = [new _AddMemoVti()];
		super.create();
	}
}