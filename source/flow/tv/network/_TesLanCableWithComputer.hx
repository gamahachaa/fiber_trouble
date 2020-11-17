package flow.tv.network;

import flow.tv._CreateSOTicketSaltTV;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _TesLanCableWithComputer extends Action 
{

	override public function create()
	{
		this._nextProcesses = [ new _CreateSOTicketSaltTV()];
		super.create();
	}
	
}