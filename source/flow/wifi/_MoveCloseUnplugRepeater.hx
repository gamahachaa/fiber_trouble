package flow.wifi;
//import sys.io.Process;
import tstool.process.Process;
import tstool.process.Action;
import tstool.process.DescisionLoop;

/**
 * ...
 * @author bb
 */
class _MoveCloseUnplugRepeater extends DescisionLoop
{
	override public function new( ?nextYes:Process, ?nextNo:Process)
	{
		super(nextYes,nextNo);
		//_next = next;
	}
	
}