package flow.wifi;

import flow.stability._TestSpeed;
import tstool.process.Process;
import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;

/**
 * ...
 * @author bb
 */
class SendRepeaterSOTemplate extends TripletTemplate 
{

	public function new ()
	{
		super(SOTemplate.FIX_566);
	}
	
	override inline function getNext():Class<Process>{
		return _TestSpeed;
	}
	
}