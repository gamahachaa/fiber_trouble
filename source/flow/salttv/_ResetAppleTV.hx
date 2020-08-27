package flow.salttv;

//import flow.nointernet.so.tckets._TvProblem;
import tstool.process.Action;
import tstool.process.ActionLoop;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _ResetAppleTV extends ActionLoop 
{
	override public function new( ?next:Process )
	{
		super( next );
		//_next = next;
	}
	//override public function create()
	//{
		//this._nextProcesses = [ new _TvProblem()];
		//super.create();
	//}
	
}