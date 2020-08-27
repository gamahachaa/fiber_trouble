package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class VtiTrackParcelVisible extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _SoOrderLogisticsEquipment()];
		this._nextYesProcesses = [new DidCustomerRecievedEmail()];
		super.create();
	}
	
}