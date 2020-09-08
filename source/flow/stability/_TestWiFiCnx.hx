package flow.stability;

import tstool.process.DescisionLoop;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _TestWiFiCnx extends DescisionLoop 
{

	public function new(?yesProcess:Process, ?noProcess:Process) 
	{
		super(yesProcess, noProcess);
		
	}
	
}