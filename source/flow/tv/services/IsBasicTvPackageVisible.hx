package flow.tv.services;
import flow.salttv._CreateSOTicketSaltTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsBasicTvPackageVisible extends Descision
{

	override public function create()
	{
		var next = new _CreateSOTicketSaltTV();
		this._nextNoProcesses = [ next ];
		this._nextYesProcesses = [ next ];
		super.create();
	}
	
}