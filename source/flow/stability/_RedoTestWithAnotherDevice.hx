package flow.stability;


import flow.tv._CreateSOTicketSaltTV;
import tstool.process.Descision;
import tstool.process.Process;
import tstool.process.Triplet;
/**
 * ...
 * @author bb
 */
class _RedoTestWithAnotherDevice extends Triplet 
{
	
	override public function new()
	{
		super();
		
	}
	override public function create()
	{
		var nextNo:Array<Process> = null;
		/**
		 * @todo String to Class<Process> / isInHistory
		 */
		if (Main.HISTORY.isInHistory("flow.Intro", No))
		{
			nextNo = [new _CreateSOTicketSaltTV()];
		}
		else{
			nextNo = [new _CreateSOTechModemSpeed()];
		}
		this._nextYesProcesses = [new _ShareAdviceOptimalWifi()];
		this._nextNoProcesses = nextNo;
		this._nextMidProcesses = nextNo;
		super.create();
	}
	
}