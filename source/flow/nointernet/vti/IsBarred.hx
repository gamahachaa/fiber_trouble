package flow.nointernet.vti;

import flow.collection._VerifyCollectionStep;
import flow.nointernet.customer.ConnectionType;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class IsBarred extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "Est que le client est barré ?";
		//this._detailTxt = "";
		//this._illustration = "vti/IsBarred_fr";
		//this._nextYesProcesses = [new BalanceAmout()];
		this._nextYesProcesses = [new _VerifyCollectionStep()];
		this._nextNoProcesses = [new IconStatusBoxManagement()];
		super.create();
	}
}