package flow.tv.remote.satltv;

import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DoesVolumeOnTvChange extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new WasThePurchaseDoneLessThanOnYearAgo()];
		this._nextYesProcesses = [new IsAppleTVvisibleOnTVScreen()];
		super.create();
	}
	
}