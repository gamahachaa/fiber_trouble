package flow.salttv;

import process.Action;

/**
 * ...
 * @author bb
 */
class _CheckHDMIcnx extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new IsAppleTVvisibleOnTVScreen()];
		super.create();
	}
	
}