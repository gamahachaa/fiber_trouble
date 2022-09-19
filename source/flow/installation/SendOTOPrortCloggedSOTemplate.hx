package flow.installation;

import flow.nointernet.so._CreateTicketModemCNX;
import flow.tickets.CustomerInstruction;
import tstool.process.DescisionTemplate;
import tstool.process.Process;
//import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;

/**
 * ...
 * @author bb
 */
class SendOTOPrortCloggedSOTemplate extends DescisionTemplate 
{

	public function new ()
	{
		super(SOTemplate.FIBER_OTO_PORT_CLOGGED,EMAIL);
	}
	
	override inline function getNext():Class<Process>{
		return CustomerInstruction;
	}
	override public function validateNo():Bool
	{
		return true;
	}
	override public function onYesClick():Void
	{
		//this._nexts = [{step: getNext(), params: []}];
		this._nexts = [{step: CustomerInstruction, params: [
													{step: _CreateTicketModemCNX},
													{step: _CreateTicketModemCNX}
												]
			}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		//this._nexts = [{step: getNext(), params: []}];
		this._nexts = [{step: CustomerInstruction, params: [
													{step: _CreateTicketModemCNX},
													{step: _CreateTicketModemCNX}
												]
			}];
		super.onNoClick();
	}
}