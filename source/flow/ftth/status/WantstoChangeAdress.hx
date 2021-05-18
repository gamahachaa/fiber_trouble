package flow.ftth.status;

import flow.equipment._GiveStatusAndRemindMyaccount;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class WantstoChangeAdress extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: _InformCanChangeAdress, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _GiveStatusAndRemindMyaccount, params: []}];
		super.onNoClick();
	}
	
}