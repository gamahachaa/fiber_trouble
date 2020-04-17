package flow.salttv;

import flow.all.vti._AddMemoVti;
import flow.nointernet.so._CreateTicketModemCNX;
import process.Descision;

/**
 * ...
 * @author bb
 */
class _ProblemSolved extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _CheckIfAppNeedsUpdate(), new _RebootAppleTV(), new _CheckIfSaltTVNeedsUpdate(), new _ResetAppleTV( new _ProblemSolved() ), new _CreateSOTickets.FIXaltTV()];
		this._nextYesProcesses = [new _AddMemoVti()];
		super.create();
	}
	
}