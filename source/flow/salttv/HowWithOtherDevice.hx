package flow.salttv;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HowWithOtherDevice extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new _ResetAppleTV()];
		this._nextYesProcesses = [ new _ResetAppleTV() ];
		super.create();
	}
}