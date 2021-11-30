package flow.nointernet.customer;

import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.vti.DoesFactoryResetSolve;
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
		this._nexts = [{step: _CreateTicketModemCNX, params: []}];
		super.onNoClick();
	}
	
}