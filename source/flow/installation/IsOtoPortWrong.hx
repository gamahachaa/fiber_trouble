package flow.installation;

import flow.nointernet.so._CreateTicketModemCNX;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsOtoPortWrong extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new  _CreateTicketModemCNX()];
		this._nextYesProcesses = [new IsOTOidAligned()];
		super.create();
	}
	
}