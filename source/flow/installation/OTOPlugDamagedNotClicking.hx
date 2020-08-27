package flow.installation;

import flow.nointernet.so._CreateTicketModemCNX;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class OTOPlugDamagedNotClicking extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _EnsureCorrectPortPlug()];
		this._nextYesProcesses = [new _CreateTicketModemCNX()];
		super.create();
	}
	
}