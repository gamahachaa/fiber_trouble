package flow.equipment;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _SendParcelTrackingByEmail extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new _InformShipmentStatusMyAccount()];
		super.create();
	}
	
}