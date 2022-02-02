package flow.installation;

import flow.nointernet.so._CreateTicketModemCNX;
import flow.tickets.CustomerInstruction;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsOTODamagedByCust extends Descision 
{
	override public function onYesClick():Void
	{
		//this._nexts = [{step: _CreateTicketModemCNX, params: []}];
		this._nexts = [{step: CustomerInstruction, params: [
													{step: _CreateTicketModemCNX},
													{step: _CreateTicketModemCNX}
												]
			}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _CheckSFP, params: []}];
		super.onNoClick();
	}
}