package flow.equipment;

import tstool.process.Action;

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