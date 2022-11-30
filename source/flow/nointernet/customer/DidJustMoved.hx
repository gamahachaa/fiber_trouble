package flow.nointernet.customer;

import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.vti.DoesFactoryResetSolve;
import flow.tickets.CustomerInstruction;
//import flow.vti.ParseVTIHealthCheck;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DidJustMoved extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: DoesFactoryResetSolve , params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//this._nexts = [{step: _CreateTicketModemCNX, params: []}];
		this._nexts = [{step: CustomerInstruction, params: [
													{step: _CreateTicketModemCNX},
													{step: _CreateTicketModemCNX}
												]
			}];
		super.onNoClick();
	}
	
}