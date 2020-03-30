package flow.salttv;

import process.Descision;

/**
 * ...
 * @author bb
 */
class IsAppleTVvisibleOnTVScreen extends Descision
{

	override public function create()
	{
		this._nextNoProcesses = [new _MakeSurePowerCableWellPlugged(), new _CheckHDMIcnx(), new _RepairProcess()];
		this._nextYesProcesses = [new IsSaltIconVisibleOnAppleTV()];
		super.create();
	}

}