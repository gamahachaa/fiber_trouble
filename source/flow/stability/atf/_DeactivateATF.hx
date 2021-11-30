package flow.stability.atf;

import tstool.process.DescisionTemplate;
import tstool.process.Process;
import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;

/**
 * ...
 * @author bb
 */
class _DeactivateATF extends DescisionTemplate 
{
	
	public function new ()
	{
		super(SOTemplate.FIX_580,EMAIL);
	}
	
	override inline function getNext():Class<Process>{
		return _TestAgain;
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
}