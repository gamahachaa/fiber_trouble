package flow.tv.network;

import flow.tv._CreateSOTicketSaltTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CanCheckWithLan extends Descision 
{
	override public function create()
	{
		this._nextNoProcesses = [ new _CreateSOTicketSaltTV()];
		this._nextYesProcesses = [ new _EnsureLanCableWellPlugged()];
		super.create();
	}
}