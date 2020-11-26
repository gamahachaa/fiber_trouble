package flow.nointernet.vti;

import flow._AddMemoVti;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsWishDatePassed extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new _AddMemoVti()];
		this._nextYesProcesses = [ new _SoOrderNotComplete()];
		super.create();
	}
	
}