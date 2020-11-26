package flow.tv.remote.satltv;

import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class _EnsureAppleTVInVisualRangeOfRemote extends Action 
{

	override public function create()
	{
		
		this._nextProcesses = [new DoesRedLedBlinksOnRemoteWhenPressed()];
		super.create();
	}
	
}