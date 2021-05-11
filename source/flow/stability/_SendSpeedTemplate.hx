package flow.stability;

//import tstool.process.DescisionTemplate;
import tstool.process.Process;
import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;

/**
 * ...
 * @author bb
 */
class _SendSpeedTemplate extends TripletTemplate 
{

	public function new ()
	{
		super(SOTemplate.FIX_552);
	}
	
	override inline function getNext():Class<Process>{
		return _AddMemoVti;
	}
	
}