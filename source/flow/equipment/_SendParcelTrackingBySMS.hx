package flow.equipment;

import process.Action;

/**
 * ...
 * @author bb
 */
class _SendParcelTrackingBySMS extends Action
{
	override public function create()
	{
		this._nextProcesses = [new _InformShipmentStatusMyAccount()];
		super.create();
	}

}