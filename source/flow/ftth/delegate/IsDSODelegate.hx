package flow.ftth.delegate;

import flow.vti._UpdateAdressVTI;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsDSODelegate extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _UpdateAdressVTI, params: [{step:_SendDelegateEmail}]}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _InformCustOrderOnHold, params: []}];
		super.onNoClick();
	}
	
}