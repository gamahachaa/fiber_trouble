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
	override public function onYesClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onMidClick();
	}
	override inline function getNext():Class<Process>{
		return _TestSpeed;
	}
	
}