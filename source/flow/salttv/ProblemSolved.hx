package flow.salttv;

import flow._AddMemoVti;
import flow.salttv._CreateSOTicketSaltTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class ProblemSolved extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _CheckIfAppNeedsUpdate(), new _RebootAppleTV(), new _CheckIfSaltTVNeedsUpdate(), new _ResetAppleTV(), new _CreateSOTicketSaltTV()];
		this._nextYesProcesses = [new flow._AddMemoVti()];
		super.create();
	}
	
}