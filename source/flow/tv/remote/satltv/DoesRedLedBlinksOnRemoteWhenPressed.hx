package flow.tv.remote.satltv;

import flow.tv.remote.satltv.CanReplaceBatteries;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DoesRedLedBlinksOnRemoteWhenPressed extends Descision 
{

	override public function create()
	{
		
		this._nextNoProcesses = [new _MakeSureBatteriesCoerrectlyInstalled(), new CanReplaceBatteries(), new WasThePurchaseDoneLessThanOnYearAgo()];
		this._nextYesProcesses = [new IsAppleTVFourthGen()];
		super.create();
	}
	
}