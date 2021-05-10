package flow.equipment;

import flow._AddMemoVti;
import process.ActionMailNointernet;
//import tstool.process.ActionMail;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class _SoOTOGivenByCustomer extends ActionMailNointernet 
{

	public function new() 
	{
		super(SOTickets.FIX_413);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
}