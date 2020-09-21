package flow.tv.install;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WantToChangeToSwiss extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new _ResetAppleTV()];
		this._nextYesProcesses = [new _HowToChangeAppleIDtoSwiss()];
		super.create();
	}
	
}