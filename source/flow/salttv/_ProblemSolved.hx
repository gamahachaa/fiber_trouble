package flow.salttv;

import flow._AddMemoVti;
import flow.nointernet.so._CreateTicketModemCNX;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class _ProblemSolved extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _CheckIfAppNeedsUpdate(), new _RebootAppleTV(), new _CheckIfSaltTVNeedsUpdate(), new _ResetAppleTV( new _ProblemSolved() ), new _CreateSOTickets.FIXaltTV()];
		this._nextYesProcesses = [new flow._AddMemoVti()];
		super.create();
	}
	
}