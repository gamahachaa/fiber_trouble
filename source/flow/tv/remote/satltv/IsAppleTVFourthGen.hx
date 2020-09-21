package flow.tv.remote.satltv;

import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsAppleTVFourthGen extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new IsAppleTVvisibleOnTVScreen()];
		this._nextYesProcesses = [ new IsLatestSaltTVAppInstalled()];
		super.create();
	}
	
}