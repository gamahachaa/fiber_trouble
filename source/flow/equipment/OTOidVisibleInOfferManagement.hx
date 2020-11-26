package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class OTOidVisibleInOfferManagement extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new CanGiveOTOid()];
		this._nextYesProcesses = [new IsPlugInUse()];
		super.create();
	}
	
}