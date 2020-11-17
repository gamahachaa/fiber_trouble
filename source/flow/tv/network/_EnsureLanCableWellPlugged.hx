package flow.tv.network;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _EnsureLanCableWellPlugged extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new DidnetworkSolved()];
		super.create();
	}
	
}