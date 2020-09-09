package flow.powercable;

import flow.nointernet.fiberbox._IsBootAbnormal;
import flow.nointernet.fiberbox._RebootBox;
import flow.nointernet.so.tckets._SwapBox;
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
		this._nextYesProcesses = [new _IsBootAbnormal()];
		this._nextNoProcesses = [new _SwapBox()];
		super.create();
	}
	
}