package flow.nointernet.vti;

//import flow.nointernet.so._CreateTicketModemCNX;
import flow.tickets.CustomerInstruction;
import flow.vti.ParseVTIHealthCheck;
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
													{step: ParseVTIHealthCheck},
													{step: ParseVTIHealthCheck}
												]
			}];
		//this._nexts = [{step: _CreateTicketModemCNX, params: []}];
		super.onNoClick();
	}
	
}