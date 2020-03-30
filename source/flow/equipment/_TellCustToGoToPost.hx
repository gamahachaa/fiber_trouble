package flow.equipment;

import process.Action;

/**
 * ...
 * @author bb
 */
class _TellCustToGoToPost extends Action 
{

override public function create()
{
	this._nextProcesses = [new _SoOrderLogisticsEquipment()];
	super.create();
}
}