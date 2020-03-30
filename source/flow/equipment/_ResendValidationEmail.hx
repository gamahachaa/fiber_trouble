package flow.equipment;

import process.Action;

/**
 * ...
 * @author bb
 */
class _ResendValidationEmail extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new _SendParcelTrackingByEmail()];
		super.create();
	}
	
}