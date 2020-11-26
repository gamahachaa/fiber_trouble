package flow.tv.remote.satltv;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CanReplaceBatteries extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _ReplaceBatteriesThenCallUsBack()];
		this._nextYesProcesses = [ new DoesRedLedBlinksOnRemoteWhenPressed()];
		super.create();
	}
	
}