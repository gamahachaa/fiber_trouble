package flow.collection;

import flow.nointernet.vti.IconStatusBoxManagement;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class IsPaymentOneHourOldVisible extends Descision 
{

	override public function create():Void
	{
		//this._titleTxt = "Un paiement datant de plus d'une heure est visible dans VTI ?";
		//this._detailTxt = "";
		//this._illustration = "";
		this._nextYesProcesses = [ new ManuallyUnblock()];
		this._nextNoProcesses = [ new _InformUsualPaymentDelays()];
		super.create();
	}
	
}