package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsVTILaposteSendBoxMsgVisible extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _ParcelIsBackToSalt, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _TellCustWeSendParcelBackAgain, params: []}];
		super.onNoClick();
	}
}