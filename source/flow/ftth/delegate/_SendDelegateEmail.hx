package flow.ftth.delegate;

import tstool.process.Action;
import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;
import tstool.salt.TemplateMail;

/**
 * ...
 * @author bb
 */
class _SendDelegateEmail extends TripletTemplate 
{
	public function new()
	{
		super(SOTemplate.FIX_334);
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: _InformToReply, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: _InformToReply, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: _InformToReply, params: []}];
		super.onMidClick();
	}
	
}