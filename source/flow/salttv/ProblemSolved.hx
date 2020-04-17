package flow.salttv;

import flow.all.vti._AddMemoVti;
import flow.salttv._CreateSOTicketSaltTV;
import process.Descision;

/**
 * ...
 * @author bb
 */
class ProblemSolved extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _CheckIfAppNeedsUpdate(), new _RebootAppleTV(), new _CheckIfSaltTVNeedsUpdate(), new _ResetAppleTV(), new _CreateSOTicketSaltTV()];
		this._nextYesProcesses = [new _AddMemoVti()];
		super.create();
	}
	
}