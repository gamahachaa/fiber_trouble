package flow.equipment;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ResendValidationEmail extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _SendParcelTrackingByEmail, params: []}];
		super.onClick();
	}
}