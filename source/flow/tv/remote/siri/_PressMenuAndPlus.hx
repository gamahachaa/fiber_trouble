package flow.tv.remote.siri;

import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import flow.tv.hardware._RepairProcess;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _PressMenuAndPlus extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new DoesAppleTVLedBlinks( new IsAppleTVvisibleOnTVScreen(), new _RepairProcess() )];
		super.create();
	}
}