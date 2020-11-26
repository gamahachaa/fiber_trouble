package flow.tv.remote.satltv;

import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _GoToStoreToReplace extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new IsAppleTVvisibleOnTVScreen()];
		super.create();
	}
	
}