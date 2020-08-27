package flow.powercable;

import flow.nointernet.fiberbox._RebootBox;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class LedPowerOn extends Descision 
{

	override public function create():Void
	{
		//this._titleTxt = "La Box est alimentée correctement ?";
		//this._detailTxt = "(la LED Power doit être verte)";
		//this._illustration = "box/powerLed";
		this._nextYesProcesses = [new _RebootBox()];
		this._nextNoProcesses = [new CanGoToTheShop()];
		super.create();
	}
	
}