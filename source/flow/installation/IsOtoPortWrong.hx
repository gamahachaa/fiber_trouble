package flow.installation;

//import flow.nointernet.so._CreateTicketModemCNX;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsOtoPortWrong extends Descision 
{

	override public function create()
	{
		this._nextYesProcesses = this._nextNoProcesses = [new OTOPlugDamagedNotClicking()];
		super.create();
	}
	
}