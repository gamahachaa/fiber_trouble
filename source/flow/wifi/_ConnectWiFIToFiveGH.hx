package flow.wifi;

import flow.stability._SelectSaltServer;
import process.Action;

/**
 * ...
 * @author bb
 */
class _ConnectWiFIToFiveGH extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new _SelectSaltServer()];
		super.create();
	}
	
}