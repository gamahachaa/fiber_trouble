package flow.nointernet.vti;

import flow.nointernet.fiberbox.NormalRxValues;
import flow.powercable.LedPowerOn;
import process.Descision;
//import process.Triplet;

/**
 * ...
 * @author ...
 */
class IconStatusBoxManagement extends Descision
{

	override public function create():Void
	{
		this._nextYesProcesses = [new NormalRxValues()];
		//this._nextNoProcesses = [new IconRedNoRX()];
		//this._nextNoProcesses = [new ActivationDone()];
		this._nextNoProcesses = [new LedPowerOn()];
		
		super.create();
	}

}