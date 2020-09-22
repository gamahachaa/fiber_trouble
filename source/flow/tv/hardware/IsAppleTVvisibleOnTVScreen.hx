package flow.tv.hardware;

import flow.tv.install.IsSaltIconVisibleOnAppleTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsAppleTVvisibleOnTVScreen extends Descision
{

	override public function create()
	{
		var nextNo = 
		if (Main.HISTORY.isInHistory("flow.tv.hardware._MakeSurePowerCableWellPlugged", Next ))
		{
			/*******************************
			 * N°2
			/*******************************/
			new _RepairProcess();
		}
		else
		{
			/*******************************
			 * N°1
			/*******************************/
			new _MakeSurePowerCableWellPlugged();
		}
		this._nextNoProcesses = [nextNo];
		this._nextYesProcesses = [new IsSaltIconVisibleOnAppleTV()];
		super.create();
	}

}