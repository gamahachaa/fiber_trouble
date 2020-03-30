package flow.nointernet.fiberbox;

import process.Action;

/**
 * ...
 * @author ...
 */
class _RebootBox extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Reboot the fiber Box";
		//this._detailTxt = "(débrancher et rebrancher l'alimentation)";
		//this._illustration = "";
		//this._nextProcesses = [new FiberLedGreenStable()];
		this._nextProcesses = [new FiberLedOff()];
		super.create();
	}
	
}