package flow.tv.remote.satltv;

import flow.tv.remote.satltv._GoToStoreToReplace;
import flow.tv.remote.satltv._NeedToBuyOneNew;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WasThePurchaseDoneLessThanOnYearAgo extends Descision 
{
	override public function create()
	{
		this._nextYesProcesses = [new _GoToStoreToReplace()];
		this._nextNoProcesses = [new _NeedToBuyOneNew()];
		super.create();
	}
}