package flow.tv.services;
import flow.equipment.DidCustomerRecievedEmail;
import flow.tv._CreateSOTicketSaltTV;
import flow.tv.CanExploreMenu;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsBasicTvPackageVisible extends Descision
{

	override public function create()
	{
		//var next = new _CreateSOTicketSaltTV();
		this._nextNoProcesses = [ new _CreateSOTicketSaltTV() ];
		this._nextYesProcesses = [ new DidCustomerRecievedEmailPaidActivationFees() ];
		super.create();
	}
	
}