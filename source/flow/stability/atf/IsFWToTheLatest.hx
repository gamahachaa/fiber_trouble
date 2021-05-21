package flow.stability.atf;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsFWToTheLatest extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: IsAdminAvailable, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _AskToRebootBox, params: []}];
		super.onNoClick();
	}
	
}