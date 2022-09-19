package flow.tv.services;
//import flow.equipment.DidCustomerRecievedEmail;
import flow.tickets.CustomerInstruction;
import flow.tv._CreateSOTicketSaltTV;
//import flow.tv.CanExploreMenu;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsBasicTvPackageVisible extends Descision
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: DidCustomerPaidActivationFees, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: CustomerInstruction, params: [{step: _CreateSOTicketSaltTV}, {step: _CreateSOTicketSaltTV}]}];
		super.onNoClick();
	}
}