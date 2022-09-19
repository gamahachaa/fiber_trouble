package flow.nointernet.vti;

import flow.nointernet.so._CreateTicketModemCNX;
import flow.tickets.CustomerInstruction;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DoesFactoryResetSolve extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: CustomerInstruction, params: [
													{step: _CreateTicketModemCNX},
													{step: _CreateTicketModemCNX}
												]
			}];
		//this._nexts = [{step: _CreateTicketModemCNX, params: []}];
		super.onNoClick();
	}
	
}