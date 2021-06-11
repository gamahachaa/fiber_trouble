package flow.ftth.delegate;

import tstool.process.Action;
import tstool.process.DescisionTemplate;
import tstool.process.Process;
//import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;
import tstool.salt.TemplateMail;

/**
 * ...
 * @author bb
 */
class _SendDelegateEmail extends DescisionTemplate 
{
	public function new()
	{
		super(SOTemplate.FIX_334, EMAIL);
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: getNext() , params: []}];
		super.onNoClick();
	}
	override public function getNext():Class<Process>
	{
		return _InformToReply;
	}
	//override public function onMidClick():Void
	//{
		//this._nexts = [{step: _InformToReply, params: []}];
		//super.onMidClick();
	//}
	
}