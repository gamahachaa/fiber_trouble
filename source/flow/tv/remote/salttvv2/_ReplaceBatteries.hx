package flow.tv.remote.salttvv2;
import flow.tickets.CustomerInstruction;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ReplaceBatteries extends Action
{

	override public function onClick():Void
	{
		this._nexts = [{step: CustomerInstruction, params: [{step: _CreateSOTicketSaltTV}, {step: _CreateSOTicketSaltTV}]}];
		super.onClick();
	}
}