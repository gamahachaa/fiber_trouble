package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class OTOidVisibleInOfferManagement extends Descision 
{

	/*override public function create()
	{
		this._nextNoProcesses = [ new CanGiveOTOid()];
		this._nextYesProcesses = [new IsPlugInUse()];
		super.create();
	}*/
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsPlugInUse, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: CanGiveOTOid, params: []}];
		super.onNoClick();
	}
}