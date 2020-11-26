package flow.equipment;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _InformShipmentStatusMyAccount extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new _OpenPostParcelTracking()];
		super.create();
	}
	
}