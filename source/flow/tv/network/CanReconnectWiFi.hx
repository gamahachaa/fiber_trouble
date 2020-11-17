package flow.tv.network;

import flow._AddMemoVti;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CanReconnectWiFi extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new CanCheckWithLan()];
		this._nextYesProcesses = [ new _AddMemoVti()];
		super.create();
	}
	
}