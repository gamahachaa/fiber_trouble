package flow.powercable;

import flow._AddMemoVti;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class CanGoToTheShop extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "Le client peut-il se rendre dans le store le plus proche ?";
		//this._detailTxt = "Làbas il pourra tester sa box avec avec une autre alimentation.";
		//this._illustration = "";
		this._nextYesProcesses = [new _AddPowercableMemo()];
		this._nextNoProcesses = [new _CreateTicketModemBoxSwap()];
		super.create();
	}

}