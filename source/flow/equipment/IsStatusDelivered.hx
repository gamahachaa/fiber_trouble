package flow.equipment;

import flow.ftth.status.WantstoChangeAdress;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsStatusDelivered extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _TellCustToGoToPost, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: WantstoChangeAdress, params: []}];
		super.onNoClick();
	}
}