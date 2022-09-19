package flow.tv.network;

import flow.tickets.CustomerInstruction;
import flow.tv._CreateSOTicketSaltTV;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _TesLanCableWithComputer extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: CustomerInstruction, params: [{step: _CreateSOTicketSaltTV}, {step: _CreateSOTicketSaltTV}]}];
		super.onClick();
	}
}