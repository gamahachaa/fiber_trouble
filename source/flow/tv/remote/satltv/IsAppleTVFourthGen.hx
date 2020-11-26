package flow.tv.remote.satltv;

import flow._AddMemoVti;
import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import flow.tv.remote.exttv.DoesVolumeChangeOnTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsAppleTVFourthGen extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new _AddMemoVti()];
		this._nextYesProcesses =  [new DoesAppleTVLedBlinks(new DoesVolumeChangeOnTV(), new WasThePurchaseDoneLessThanOnYearAgo())] ;
		super.create();
	}
	
}